variable "project_id" {
  type = string
}

variable "gke_sa_name" {
  type = string
  default = "gke_cluster_sa"
}

variable "workload_identity_bindings" {
  description = "Bindings of GKE KSA to GCP SA for workload identity"
  type = map(object({
    project   = string
    namespace = string
    k8s_sa    = string
    gsa_email = string
  }))
}
