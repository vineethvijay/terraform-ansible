data "template_file" "webserver_hosts" {
  template = "${file("${path.module}/templates/inventory.cfg")}"
  depends_on = [
    "aws_instance.webserver1",
    "aws_instance.webserver2",
  ]
  vars {
    webserver1_ip = "${aws_instance.webserver1.public_ip}"
    webserver2_ip = "${aws_instance.webserver2.public_ip}"
  }
}

resource "null_resource" "webserver_hosts" {
  triggers {
    template_rendered = "${data.template_file.webserver_hosts.rendered}"
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.webserver_hosts.rendered}' > inventory_list"
  }
}