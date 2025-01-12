# Service Account for GKE
resource "google_service_account" "gke_service_account" {
  account_id   = "gke-service-account"
  display_name = "Service Account for GKE"
}

# Service Account for Database
resource "google_service_account" "sql_service_account" {
  account_id   = "sql-service-account"
  display_name = "Service Account for SQL Database"
}

# IAM roles assignment for users or service accounts
resource "google_project_iam_member" "gke_admin_role" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

resource "google_project_iam_member" "sql_admin_role" {
  project = var.project_id
  role    = "roles/cloudsql.admin"
  member  = "serviceAccount:${google_service_account.sql_service_account.email}"
}
