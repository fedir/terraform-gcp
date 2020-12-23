# Terraform on GCP

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
