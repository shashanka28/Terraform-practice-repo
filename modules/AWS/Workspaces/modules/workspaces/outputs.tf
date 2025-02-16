output "workspace_id" {
    description = "List of created WorkSpaces IDs"
    value = aws_workspaces_workspace.example.id
}