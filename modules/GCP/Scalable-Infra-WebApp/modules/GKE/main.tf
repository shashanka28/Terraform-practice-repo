resource "google_container_cluster" "primary" {
  name     = "prod-gke-cluster"
  location = var.region

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true
}


resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 30
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
