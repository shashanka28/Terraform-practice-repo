# Output the email of the GKE service account
output "gke_service_account_email" {
  value       = google_service_account.gke_service_account.email
  description = "The email address of the GKE service account"
}

# Output the email of the SQL service account
output "sql_service_account_email" {
  value       = google_service_account.sql_service_account.email
  description = "The email address of the SQL service account"
}

# Output the roles assigned to service accounts
output "gke_admin_role" {
  value       = google_project_iam_member.gke_admin_role.role
  description = "The IAM role assigned to the GKE service account"
}

output "sql_admin_role" {
  value       = google_project_iam_member.sql_admin_role.role
  description = "The IAM role assigned to the SQL service account"
}
