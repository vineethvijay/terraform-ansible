# Terraform+Ansible Example

## Setup

1. Install the following locally:
    * Terraform
    * Terraform Inventory
    * Anisble (2.4+)
2. Set up AWS credentials in [`~/.aws/credentials`]
3. Ensure you have an SSH public key at `~/.ssh/id_rsa.pub`

## Usage

```sh
export AWS_DEFAULT_REGION=us-east-1

./deploy.sh
```

## Cleanup

```sh
cd terraform
terraform destroy
```
