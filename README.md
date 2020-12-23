# Terraform on GCP

## GCP config

* Get service account key https://console.cloud.google.com/apis/credentials/serviceaccountkey with the Project > Editor role
* Download the JSON key file and put it in the folder
* Specify it in the terraform.tfvars

## terraform.tfvars example
```
project = "YOUR_GCP_PROJECT_ID"
credentials_file = "YOUR_KEYFILE.json"
cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]
region = "YOUR_GCP_ZONE"
machine_types = {
  dev  = "f1-micro"
  test = "n1-highcpu-32"
  prod = "n1-highcpu-32"
}
ssh_user = "YOUR_SSH_USER"
```

## Some useful commands

```
terraform init
terraform plan
terraform apply
terraform refresh
terraform show
terraform destroy
```

## Install Terraform

```
Download from https://www.terraform.io/downloads.html
Ensure, what /usr/local/bin is in the PATH
echo $PATH
mv ~/Downloads/terraform /usr/local/bin/
terraform -help
terraform -help plan
```

## Build Infrastructure

```
terraform init
terraform plan
terraform apply
```

## Change Infrastructure

```
terraform plan
terraform apply
terraform show
```

## Destroy Infrastructure

```
terraform show
terraform destroy
terraform show
```
## Create Resource Dependencies
```
terraform plan
terraform init
terraform plan
```
## Provision Infrastructure
```
terraform taint google_compute_instance.vm_instance
terraform apply
```
## Define Input Variables
```
terraform.tfvars
variables.tf
```
## Query Data with Output Variables
```
terraform output ip
```
## Ressources

* https://learn.hashicorp.com/collections/terraform/gcp-get-started
* https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform
* https://cloud.google.com/storage/docs/locations
* https://labouardy.com/deploy-private-docker-registry-on-gcp-with-nexus-terraform-and-packer/ 
