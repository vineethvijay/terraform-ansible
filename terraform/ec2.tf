locals {
  # The default username for our AMI
  vm_user = "ubuntu"
}

# Get the latest Ubuntu Xenial AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "webserver" {
  instance_type = "t2.medium"
  tags = "${var.tags}"
  ami = "${data.aws_ami.ubuntu.id}"

  # The name of our SSH keypair
  key_name = "${var.key_name}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  subnet_id = "${aws_subnet.default.id}"

  provisioner "local-exec" {
    command = "sleep 60 & echo waiting"
    on_failure = "continue"
  }

  # force Terraform to wait until a connection can be made, so that Ansible doesn't fail when trying to provision
  provisioner "remote-exec" {
    # The connection will use the local SSH agent for authentication
    inline = ["echo Successfully connected"]

    # The connection block tells our provisioner how to communicate with the resource (instance)

    connection {
      host = "${aws_instance.webserver.public_ip}"
      type = "ssh"
      user = "ubuntu"
      port = "22"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }
}
