variable "environment" {
  type = string
}

variable "location" {
  type = "string"
  default = "eastus"
}

variable "resource_group" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "tenant_id" {
  type = string
}
