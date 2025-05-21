variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "kms_key_id" {
  description = "KMS key ID to use for S3 encryption"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}
