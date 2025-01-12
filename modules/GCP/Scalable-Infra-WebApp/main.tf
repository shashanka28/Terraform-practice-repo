provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "network" {
  source = "./modules/network"
  project_id = var.project_id
  region     = var.region
}

module "gke" {
  source = "./modules/gke"
  project_id = var.project_id
  region     = var.region
  network    = module.network.network_name
  subnetwork = module.network.subnetwork_name
}

module "database" {
  source = "./modules/database"
  project_id = var.project_id
  region     = var.region
}

module "storage" {
  source = "./modules/storage"
  project_id = var.project_id
}

module "monitoring" {
  source = "./modules/monitoring"
  project_id = var.project_id
}


resource "google_project_iam_member" "user_editor" {
  project = var.project_id
  role    = "roles/editor"
  member  = "user:${var.user_email}"
}


module "iam" {
  source       = "./modules/iam"
  project_id   = var.project_id
  gke_service_account_name = "gke-service-account"
  sql_service_account_name = "sql-service-account"
}

# Example of referencing the output from the IAM module
output "gke_service_account_email" {
  value = module.iam.gke_service_account_email
  description = "The email of the GKE service account"
}

output "sql_service_account_email" {
  value = module.iam.sql_service_account_email
  description = "The email of the SQL service account"
}

