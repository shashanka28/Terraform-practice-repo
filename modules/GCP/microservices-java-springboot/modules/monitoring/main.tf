resource "google_monitoring_alert_policy" "high_cpu_alert" {
  display_name = "High CPU Usage Alert"
  combiner     = "OR"

  conditions {
    display_name = "VM Instance CPU Usage"
    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
      comparison      = "COMPARISON_GT"
      threshold_value = 0.8
      duration        = "60s"

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = var.notification_channels
  enabled               = true
}
