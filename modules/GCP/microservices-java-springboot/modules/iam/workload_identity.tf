
/*    
        GKE workloads can access GCP services like secret manager without storing any credentials in the cluster 
 using Workload identity setup b/w KSA & GCP IAM service account (GSA)

*/

resource "google_service_account_iam_member" "workload_identity_binding" {
  for_each = var.workload_identity_bindings

  service_account_id = each.value.gsa_email
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${each.value.project}.svc.id.goog[${each.value.namespace}/${each.value.k8s_sa}]"
}
