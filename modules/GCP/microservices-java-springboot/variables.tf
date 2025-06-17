variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "bucket_name" {
    type = string
}

variable "kms_key_name" { 
    type = string
    default = ""
}

variable "notification_channels" {
  type        = list(string)
  description = "Notification channel IDs for alerts"
}

