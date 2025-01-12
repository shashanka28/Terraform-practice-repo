output "network_name" {
  value = module.network.network_name
}

output "gke_cluster_endpoint" {
  value = module.gke.endpoint
}

output "database_instance_name" {
  value = module.database.instance_name
}

output "storage_bucket_name" {
  value = module.storage.bucket_name
}

output "monitoring_dashboard_id" {
  value = module.monitoring.dashboard_id
}
