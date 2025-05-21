variable "description" {
  description = "Description of the KMS key"
  type        = string
}

variable "alias" {
  description = "Alias name for the KMS key"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the KMS key"
  type        = map(string)
  default     = {}
}
