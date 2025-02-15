variable "user_name" {
  description = "The username for which the AWS WorkSpace will be created"
  type        = string
}

# Fetch IAM user dynamically
data "aws_iam_user" "example_user" {
  user_name = var.user_name  # Dynamically set through terraform.tfvars or other sources
}

output "user_name" {
  value = data.aws_iam_user.example_user.user_name
}

output "user_arn" {
  value = data.aws_iam_user.example_user.arn
}
