variable "vpc_name" {
  type = string
}

variable "region" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "ssh_source_ranges" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

