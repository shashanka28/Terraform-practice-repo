variable "vpc_id" {
  description = "AWS VPC ID info"
  type = string
}

variable "subnet_ids" {
  description = "AWS subnets ID info"
  type = string
}

variable "cidr_blocks" {
  description = " CIDR block for AWS VPC "
  type = string
  default = "10.0.0.0/16"
}

variable "ami" {
  description = "AMI ID for WebShpere EC2 instances"
  type = string
}

variable "instance_type" {
  description = "type of aws ec2 instance"
  type = string
  default = "t2.medium"
}



variable "count" {
  description = "Number of instances or resources to be created"
  type = number
}