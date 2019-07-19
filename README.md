# Terraform+Ansible Example

## Setup

1. Install the following locally:
    * Terraform
    * Terraform Inventory
    * Python
    * pip
2. Set up AWS credentials in [`~/.aws/credentials`]
3. Ensure you have an SSH public key at `~/.ssh/id_rsa.pub`

## Usage

```sh
export AWS_DEFAULT_REGION=us-east-1
pip install -r requirements.txt

./deploy.sh
```

## Cleanup

```sh
cd terraform
terraform destroy
```
