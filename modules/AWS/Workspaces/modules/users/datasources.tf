data "aws_iam_user" "existing_user" {
  user_name = var.selected_user  # Dynamically assign the user
}
