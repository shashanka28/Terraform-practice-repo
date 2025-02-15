variable "directory_id" {
  description = "The directory ID for WorkSpaces"
  type        = string
}

variable "user_name" {
  description = "The username for the WorkSpace"
  type        = string
}

variable "bundle_id" {
  description = "The bundle ID for the WorkSpace"
  type        = string
}



# Create AWS WorkSpace for the user
resource "aws_workspaces_workspace" "example" {
  directory_id = var.directory_id
  user_name    = var.user_name
  bundle_id    = var.bundle_id

  tags = {
    Name = "WorkSpace for ${var.user_name}"
  }
}

output "workspace_id" {
  value = aws_workspaces_workspace.example.id
}
