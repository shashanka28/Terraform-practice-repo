

# Module to fetch user information dynamically (from IAM, SSO, or AD)
module "users" {
    source = "./modules/users"
    user_name = var.user_name  # Pass the user name dynamically
}

# Module to create AWS Workspaces based on the fetched user information
module "workspaces" {
  source       = "./modules/workspaces"
  user_name    = module.users.user_name
  directory_id = var.directory_id
  bundle_id    = var.bundle_id
}

