variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "environment" {
  description = "Environment label (e.g., dev, prod)"
  type        = string
}

variable "secret_id" {
  type = string
}

variable "secrets" {
  description = <<EOT
Map of secret names. Values are optional placeholder strings (e.g., use `"REDACTED"` if not uploading value).
Example:
  {
    "db-password" = "REDACTED"
    "api-key"     = "REDACTED"
  }
EOT
  type = map(string)
}

variable "secrets_with_values" {
  description = "Actual secrets to upload. Null or skip key if you don't want to upload."
  type        = map(string)
  default     = {}
}

variable "secret_access_bindings" {
  description = <<EOT
Map of secret -> list of service accounts that need access.
Example:
  {
    "db-password" = ["ci-cd-sa@project.iam.gserviceaccount.com"]
    "api-key"     = ["app1-sa@project.iam.gserviceaccount.com", "app2-sa@project.iam.gserviceaccount.com"]
  }
EOT
  type    = map(list(string))
  default = {}
}
