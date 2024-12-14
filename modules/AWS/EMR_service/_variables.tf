variable "environment" {
    description = "AWS ENVIRONMENT"
    type = string
}

variable "required_common_tags" {
  description = "minimum required map of tags required for AWS RESOURCES for compliance purpose."
  type = map(string)
}

variable "emr_instance_role_name" {
  default = ""
  description = "the name of EMR INSTANCE ROLE"
  type = string
}

variable "cluster_name" {
  default = ""
  description = "the EMR cluster name"
  type = string
}

variable "service_role" {
    default = ""
}

variable "emr_iam_instance_profile" {
  default = ""
}

variable "log_uri" {
  default = ""
  description = "Publish cluster logs to specific S3 bucket"
}

variable "task_instance_ebs_size" {
  default = 10
  description = "task instance volume size in GibiBytes (GiB)"
  type = number
}

variable "task_instance_ebs_type" {
  default = "gp2"
  description = "task instance volume type, valid options are 'gp2', 'io1', and 'standard' "
  type = string
}

variable "ec2keypair" {
  default = ""
  description = "ec2 keypair value used to connect EMR cluster using SSH"
  type = string
}

variable "aws_subnet_id" {
  default = ""
  description = "AWS subnet ID that EMR will bound to"
  type = string
}

variable "vpc_id" {
  default = ""
  description = "AWS VPC ID that EMR will be boound to" 
}

variable "aws_service_security_group_id" {
  default = ""
  description = "AWS security group ID for service access to EMR instances"
}

variable "aws_primary_security_group_id" {
  default = ""
  description = "AWS security group ID for primary comms for EMR instances"
}

variable "aws_core_security_group_id" {
  default = ""
  description = "AWS security group ID for core and tasks comms for EMR instances"
}

variable "nodes_subnet_id" {
  default = ""
  description = "the subnet ID to deploy the EMR cluster nodes. Note: the ec2 instance type has to be supported in the AZ it is deployed in."
}

