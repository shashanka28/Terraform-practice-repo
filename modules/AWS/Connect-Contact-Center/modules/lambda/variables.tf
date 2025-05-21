variable "function_name" {
  type        = string
  description = "Name of the Lambda function"
}

variable "handler" {
  type        = string
  default     = "handler.lambda_handler"
}

variable "runtime" {
  type        = string
  default     = "python3.11"
}

variable "timeout" {
  type        = number
  default     = 10
}

variable "iam_role_arn" {
  type        = string
  description = "IAM role ARN to attach to the Lambda function"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
