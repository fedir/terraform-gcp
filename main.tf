## Providers

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

## Project

provider "google" {
  credentials = file(var.credentials_file)
  project = "my-lab-298819"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}

## Network

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_address" "vm_static_ip" {
  name = "terraform-static-ip"
  region       = "europe-west1"
}

## Storage

resource "random_string" "bucket" {
  length  = 8
  special = false
  upper   = false
}

resource "google_storage_bucket" "example_bucket" {
  name     = "learn-gcp-${random_string.bucket.result}"
  location = "US"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

## Compute Engines

resource "google_compute_instance" "vm_instance" {
  depends_on = [google_storage_bucket.example_bucket]
  name         = "terraform-instance"
  machine_type = var.machine_types[var.environment]
  tags         = ["web", "dev"]
  metadata = {
    ssh-keys = "${var.ssh_user}:${file("~/.ssh/id_rsa.pub")}"
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata_startup_script = "sudo apt-get -y update; sudo apt-get -y install nginx; sudo service nginx start"
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
  provisioner "local-exec" {
    command = "echo ${google_compute_instance.vm_instance.name}:  ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  }
}

## Firewall

resource "google_compute_firewall" "default" {
 name    = "nginx-firewall"
 network = "terraform-network"
  allow {
   protocol = "tcp"
   ports    = ["22", "80"]
 }
}

## Output

output "ip" {
  value = google_compute_address.vm_static_ip.address
}