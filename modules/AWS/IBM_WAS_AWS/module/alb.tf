resource "aws_lb" "ibm_websphere_lb" {
  name = "ibm-websphere-aws-lb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.websphere_sg.id]
  subnets = var.subnet_ids[0]
}

resource "aws_lb_target_group" "websphere_target_group" {
  name = "ibm-websphere-aws-target-group"
  port = 8080
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

