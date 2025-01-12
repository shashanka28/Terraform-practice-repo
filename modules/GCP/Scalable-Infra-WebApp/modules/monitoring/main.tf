resource "google_monitoring_dashboard" "default" {
  dashboard_json = jsonencode({
    displayName = "prod-dashboard"
    gridLayout  = {
      widgets = [
        {
          title = "CPU Usage"
          xyChart = {
            dataSets = [
              {
                timeSeriesQuery = {
                  timeSeriesFilter = {
                    filter = "metric.type=\"compute.googleapis.com/instance/cpu/usage_time\""
                  }
                }
              }
            ]
          }
        }
      ]
    }
  })
}




resource "google_monitoring_notification_channel" "email" {
  display_name = "Admin Email Notifications"
  type         = "email"
  labels = {
    email_address = "admin@example.com"
  }
}
/// Notification Channels are for alerting as mentioned above and  Google Cloud Pub/Sub is for asynchronous messaging ////


resource "google_monitoring_alert_policy" "high_cpu_usage" {
  display_name = "High CPU Usage Alert"
  combiner     = "OR" # Specifies how to combine multiple conditions, if any.

  conditions {
    display_name = "CPU Utilization Condition"

    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\""
      comparison      = "COMPARISON_GT"
      threshold_value = 0.8
      duration        = "60s"

      aggregations {
        alignment_period    = "60s"
        per_series_aligner  = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.id]

  documentation {
    content  = "This alert is triggered when CPU utilization exceeds 80%."
    mime_type = "text/markdown"
  }

  user_labels = {
    environment = "production"
  }
}

