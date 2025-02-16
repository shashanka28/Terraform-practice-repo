module "users" {
  source       = "../../modules/users"
  selected_user = var.user_name   # IAM user for the WorkSpace


  # Additional configurations if required for the users module
}

module "workspaces" {
  source       = "../../modules/workspaces"
  bundle_id    = var.bundle_id  # Replace with your actual bundle ID
  directory_id = var.directory_id  # Replace with your actual directory ID
  user_name = var.user_name
}

variable "user_name" {
  description = "The username for the WorkSpace"
  type        = string
}

variable "directory_id" {
  description = "The directory ID for WorkSpaces"
  type        = string
}

variable "bundle_id" {
  description = "The bundle ID for the WorkSpace"
  type        = string
}

variable "user_email" {
  description = "The email of the user who will be assigned the workspace"
  type        = string
}
