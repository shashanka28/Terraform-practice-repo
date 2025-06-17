resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  project  = var.project_id

  network    = var.network
  subnetwork = var.subnetwork

  ip_allocation_policy {
    cluster_secondary_range_name  = var.ip_range_pods
    services_secondary_range_name = var.ip_range_services
  }

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "default_pool" {
  name       = "default-pool"
  project    = var.project_id
  cluster    = google_container_cluster.primary.name
  location   = var.region

  node_config {
    machine_type    = "e2-medium"
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    service_account = var.gke_sa_email
    labels = {
      environment = "prod"
    }
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}
