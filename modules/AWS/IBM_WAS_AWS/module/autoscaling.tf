resource "aws_launch_configuration" "ibm_websphere_aws_launch_config" {
  name = "IBM-WebSphere-AWS-launch-config"
  image_id = var.ami
  instance_type = var.instance_type
}




resource "aws_autoscaling_group" "ibm_websphere_aws_asg" {
  desired_capacity = 3
  max_size = 4
  min_size = 2
  vpc_zone_identifier = var.subnet_ids[0]
  launch_configuration = aws_launch_configuration.ibm_websphere_aws_launch_config.id
}

