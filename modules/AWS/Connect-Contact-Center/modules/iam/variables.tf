variable "lambda_role_name" {
  description = "IAM role name for Lambda"
  type        = string
}

variable "inline_policy" {
  description = "Inline policy JSON content"
  type        = string
}

variable "tags" {
  description = "Tags for IAM resources"
  type        = map(string)
  default     = {}
}
