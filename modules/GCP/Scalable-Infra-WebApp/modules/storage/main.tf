resource "google_storage_bucket" "default" {
  name          = "prod-storage-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    action {
      type = "SetStorageClass"
      storage_class = "NEARLINE"
    }
    condition {
      age = 30
    }
  }
}
