output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "workload_identity_pool" {
  value = google_container_cluster.primary.workload_identity_config[0].workload_pool
}
