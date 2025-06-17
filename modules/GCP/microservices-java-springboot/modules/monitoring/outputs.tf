output "monitoring_alert_name" {
  value = google_monitoring_alert_policy.high_cpu_alert.name
}
