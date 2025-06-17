resource "google_secret_manager_secret" "secrets" {
  secret_id = var.secret_id
  for_each = var.secrets

  name     = each.key
  project  = var.project_id
  replication {
    auto {
    }
  }

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

# Optional: Upload secret values securely during provisioning
resource "google_secret_manager_secret_version" "secrets_version" {
  for_each = {
    for key, value in var.secrets : key => value if var.secrets_with_values[key] != null
  }

  secret      = google_secret_manager_secret.secrets[each.key].id
  secret_data = var.secrets_with_values[each.key]
}

# IAM bindings for service accounts to access secrets
resource "google_secret_manager_secret_iam_member" "access" {
  for_each = merge([
    for secret_name, sa_list in var.secret_access_bindings : {
      for sa in sa_list :
      "${secret_name}-${sa}" => {
        secret_name = secret_name
        sa_email    = sa
      }
    }
  ]...)

  secret_id = google_secret_manager_secret.secrets[each.value.secret].id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${each.value.sa}"
}
