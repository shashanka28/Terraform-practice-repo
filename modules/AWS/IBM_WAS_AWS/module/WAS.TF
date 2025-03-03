resource "null_resource" "ibm_websphere_install" {
    depends_on = [ aws_instance.websphere ]

    connection {
      host = aws_instance.websphere[0].public_ip
      user = "ibm-aws-user"
      private_key = var.private_key
    }

    provisioner "remote-exec" {
      inline = [ 
        "sudo yum update -y",
        "wget https://org.com/websphere_installer.tar.gz",
        "tar -xzvf websphere_installer.tar.gz",
        "cd websphere_installer && ./install.sh -silent"
       ]
    }
}
