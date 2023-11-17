variable "admin_password" {
  type = string
}

variable "host" {
  type = string
}

resource "null_resource" "name" {
  connection {
    type = "winrm"
    user     = "Administrator"
    password = "${var.admin_password}"
    host     = "${var.host}"
  }

  provisioner "file" {
    source = "source/scripts"
    destination = "/scripts"
  }  
  
  provisioner "remote-exec" {
    inline = [  ]
  }
}