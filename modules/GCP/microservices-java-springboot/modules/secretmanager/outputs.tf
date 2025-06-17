output "secret_names" {
  value = keys(var.secrets)
}

output "secret_resource_ids" {
  value = {
    for k, v in google_secret_manager_secret.secrets : k => v.id
  }
}
