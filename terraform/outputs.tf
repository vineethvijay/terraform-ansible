output "Endpoint" {
  value = "http://${aws_instance.webserver.public_ip}"
}

output "Ssh" {
  value = "ssh ${local.vm_user}@${aws_instance.webserver.public_ip}"
}
