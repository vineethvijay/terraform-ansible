# Terraform+Ansible Example

## Setup

1. Install the following locally:
    * Terraform
    * Terraform Inventory
    * Anisble (2.4+)
2. Set up AWS credentials in [`~/.aws/credentials`]
3. Ensure you have an SSH public key at `~/.ssh/id_rsa.pub`


### Dynamic inventory - select `multi_hosts` branch

`cd ansible && ansible-playbook -i ../terraform/inventory_list main.yml`