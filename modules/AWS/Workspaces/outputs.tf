

output "workspace_id" {
    description = "List of created WorkSpaces IDs"
    value = module.workspaces.workspace_id
}

output "user_arn" {
  value = module.users.user_arn
}

output "user_name" {
  value = data.aws_iam_user.example_user.user_name
}

output "workspace_id" {
  value = aws_workspaces_workspace.example.id
}