output "dns_name" {
  value = aws_lb.ibm_websphere_lb.dns_name
}

output "asg_name" {
  value = aws_autoscaling_group.ibm_websphere_aws_asg.name
}