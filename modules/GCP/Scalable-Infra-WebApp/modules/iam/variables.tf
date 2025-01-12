# project_id - GCP project ID
variable "project_id" {
  description = "The GCP project ID where the IAM resources will be applied"
  type        = string
}

# gke_service_account_name - Name for the GKE service account
variable "gke_service_account_name" {
  description = "Name for the service account associated with GKE"
  type        = string
  default     = "gke-service-account"
}

# sql_service_account_name - Name for the SQL service account
variable "sql_service_account_name" {
  description = "Name for the service account associated with SQL Database"
  type        = string
  default     = "sql-service-account"
}
