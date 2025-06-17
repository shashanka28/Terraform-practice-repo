variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
}

variable "cluster_name" {
  type        = string
}

variable "network" {
  type        = string
}

variable "subnetwork" {
  type        = string
}

variable "ip_range_pods" {
  type = string
}

variable "ip_range_services" {
  type = string
}

variable "gke_sa_email" {
  type        = string
  description = "IAM Service Account email to bind via Workload Identity"
}
