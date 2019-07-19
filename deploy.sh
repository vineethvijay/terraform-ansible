#!/bin/bash

set -e
set -x

# ensure SSH agent has all keys
ssh-add -A

# set up the infrastructure
cd terraform
terraform init
terraform apply -auto-approve

cd ../ansible

#TF_STATE=../terraform/terraform.tfstate ansible-playbook "--inventory-file=$(which terraform-inventory)" provision-tomcat.yml
#echo "Tomcat setup Success !"

#TF_STATE=../terraform/terraform.tfstate ansible-playbook "--inventory-file=$(which terraform-inventory)" provision-nginx.yml
#echo "Nginx proxy setup Success!"


TF_STATE=../terraform/terraform.tfstate ansible-playbook "--inventory-file=$(which terraform-inventory)" main.yml


cd ../terraform
terraform output
