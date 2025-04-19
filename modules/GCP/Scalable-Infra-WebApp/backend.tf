terraform {
  backend "gcs" {
    bucket = "terraform-state-scalableWebAppInfra"
    prefix = "env/dev"
  }
}