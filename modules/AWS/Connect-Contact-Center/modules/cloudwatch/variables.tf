variable "lambda_name" {
  description = "Lambda function name"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
