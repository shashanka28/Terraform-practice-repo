variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "Primary key (partition key) for the table"
  type        = string
}

variable "hash_key_type" {
  description = "DynamoDB key type: S or N"
  type        = string
  default     = "S"
}

variable "kms_key_arn" {
  description = "KMS key ARN for encryption"
  type        = string
}

variable "tags" {
  description = "Tags for the DynamoDB table"
  type        = map(string)
  default     = {}
}
