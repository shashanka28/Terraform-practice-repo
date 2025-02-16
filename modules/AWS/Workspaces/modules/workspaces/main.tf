resource "aws_workspaces_workspace" "example" {
  directory_id     = aws_workspaces_directory.example.id #var.directory.id
  bundle_id        = var.bundle_id
  user_name        = data.aws_iam_user.existing_user.name  # Dynamically assigned username

  tags = {
    Name = "Example Workspace for ${data.aws_iam_user.existing_user.name}"
  }
}
