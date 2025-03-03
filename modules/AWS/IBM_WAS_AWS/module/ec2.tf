resource "aws_instance" "ibm_websphere_aws_ec2" {
  count = var.count

  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_ids[0]
  security_groups = [aws_security_group.websphere_sg.name]
  tags = {
    name = "IBM-Websphere-AWS-EC2-instance"
  }
}

resource "aws_security_group" "websphere_sg" {
  name = "IBM WebSphere AWS Security Group"
  description = "Allow inbound traffic for WebSphere"
  vpc_id = var.vpc_id

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9443
    to_port = 9443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}