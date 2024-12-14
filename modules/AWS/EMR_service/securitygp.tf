resource "aws_security_group" "core_security_group" {
    description = "The Amazon EC2 EMR-managed security group for the core nodes"
    name_prefix = "${var.cluster_name}-core-sg"
    revoke_rules_on_delete = true
    vpc_id = var.vpc_id

    egress {
        cidr_blocks = ["0.0.0.0"]
        description = "Allow all egress"
        from_port = 0
        protocol = "-1"
        to_port = 0
    }

    lifecycle {
      ignore_changes = [ ingress, egress ]
    }
}


resource "aws_security_group" "master_security_group" {
    description = "The Amazon EC2 EMR-managed security group for the master node"
    name_prefix = "${var.cluster_name}-master-sg"
    revoke_rules_on_delete = true
    vpc_id = var.vpc_id

    egress {
        cidr_blocks = ["0.0.0.0"]
        description = "Allow all egress"
        from_port = 0
        protocol = "-1"
        to_port = 0
    }

    lifecycle {
      ignore_changes = [ ingress, egress ]
    }
}


resource "aws_security_group" "service_access_security_group" {
    description = "The Amazon EC2 service-access security group"
    name_prefix = "${var.cluster_name}-svacc-sg"
    revoke_rules_on_delete = true
    vpc_id = var.vpc_id

    egress {
        cidr_blocks = ["0.0.0.0"]
        description = "Allow all egress"
        from_port = 0
        protocol = "-1"
        to_port = 0
    }

    lifecycle {
      ignore_changes = [ ingress, egress ]
    }
}

resource "aws_security_group_rule" "master_to_core" {
  from_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.core_security_group.id
  source_security_group_id = aws_security_group.master_security_group.id
  to_port = 65535
  type = "ingress"
}
