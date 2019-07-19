variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  default = "terraform-ansible-example-key"
}

variable "tags" {
  type = "map"
  default = {
    Terraform = true
    Name = "Tomcat_nginx - terraform+ansible"
  }
}
