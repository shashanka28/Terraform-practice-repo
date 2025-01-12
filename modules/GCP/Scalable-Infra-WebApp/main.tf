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
