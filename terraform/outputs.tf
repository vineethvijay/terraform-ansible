output "Endpoint1" {
  value = "http://${aws_instance.webserver1.public_ip}"
}

output "Ssh1" {
  value = "ssh ${local.vm_user}@${aws_instance.webserver1.public_ip}"
}

output "Endpoint2" {
  value = "http://${aws_instance.webserver2.public_ip}"
}

output "Ssh2" {
  value = "ssh ${local.vm_user}@${aws_instance.webserver2.public_ip}"
}