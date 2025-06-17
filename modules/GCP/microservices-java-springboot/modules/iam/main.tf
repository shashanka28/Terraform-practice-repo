resource "google_service_account" "gke_sa" {
  account_id = var.gke_sa_name
  display_name = "GKE Service Account"
}

resource "google_project_iam_member" "gke_sa_logging" {
  project = var.project_id
  role = "roles/logging_logWriter"
  member = "serviceAccount:${google_service_account.gke_sa.email}"
}

resource "google_project_iam_member" "gke_sa_monitorting" {
  project = var.project_id
  role = "roles/monitoring.metricWriter"
  member = "serviceAccount:${google_service_account.gke_sa.email}"
}

resource "google_project_iam_custom_role" "custom_viewer" {
  role_id = "CustomViewer"
  title = "Custom Viewer Role"
  description = "Custom role with least privilege access"
  project = var.project_id

  permissions = [
    "resourcemanager.projects.get",
    "compute.instances.list"
  ]
}