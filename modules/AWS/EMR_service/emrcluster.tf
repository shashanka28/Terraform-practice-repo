locals {
    asgpolicy = file("$(path.module)/autoscaling_policy.json.tmpl")
}

data "aws_iam_role" "existing_role" {
    name = ""
}

data "aws_iam_role" "emr_autoscaling" {
    name = ""
}

data "aws_iam_role" "instance_role" {
    name= var.emr_instance_role_name
}

data "aws_subnet" "current" {
    id = var.nodes_subnet_id
}

resource "aws_iam_instance_profile" "instance_profile" {
    name = "$(var.emr_instance_role_name)-$(var.cluster_name)"
    role = data.aws_iam_role.instance_role.id
}

resource "aws_emr_cluster" "cluster_name" {
    name = var.cluster_name
    release_label = "emr-5.33.0"
    applications = ["Hadoop", "Hive", "Hue", "Spark"]

    autoscaling_role = data.aws_iam_role.emr_autoscaling.arn

    termination_protection = false
    log_uri = var.log_uri


    master_instance_group {
      instance_type = ""
      name = "MasterNode"
      instance_count = 1
    }

    core_instance_group {
      instance_type = ""
      name = "CoreNode"
      instance_count = 1

      autoscaling_policy = local.asgpolicy
    }

    ec2_attributes {
      subnet_id = var.aws_subnet_id

      key_name = var.ec2keypair
      service_access_security_group = var.aws_service_security_group_id
      emr_managed_master_security_group = var.aws_primary_security_group_id
      emr_managed_slave_security_group = var.aws_core_security_group_id
      instance_profile = aws_iam_instance_profile.instance_profile.name
    }


    service_role = var.service_role

    tags = var.required_common_tags
}

resource "aws_emr_instance_group" "task_instance_group_1" {
    cluster_id = aws_emr_cluster.cluster_name.id
    name = "Task - 1"
    instance_type = ""

    ebs_config {
      type = var.task_instance_ebs_type
      size = var.task_instance_ebs_size
    }
}
