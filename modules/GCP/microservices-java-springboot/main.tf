module "iam" {
  source = "./modules/iam"
  project_id = var.project_id
  gke_sa_name = "gke-cluster-sa"
  
  workload_identity_bindings = {
    "my-app" = {
        project   = var.project_id
        namespace = "default"
        k8s_sa    = "my-app-ksa"
        gsa_email = module.gke_sa.email
    }
  }
}

module "networking" {
  source = "./modules/networking"
  vpc_name = "prod-vpc"
  region = var.region
  private_subnet_cidr = "10.0.1.0/24"
  public_subnet_cidr = "10.0.2.0/24"
  ssh_source_ranges = ["127.8.0.1/32"]
}

module "secrets" {
  source     = "./modules/secret-manager"
  project_id = var.project_id
  environment = "dev"

  secrets = {
    "db-password"  = "REDACTED"
    "api-token"    = "REDACTED"
  }

  secrets_with_values = {
    "db-password" = var.db_password
    # api-token intentionally not stored via Terraform
  }

  secret_access_bindings = {
    "db-password" = ["my-ci-sa@${var.project_id}.iam.gserviceaccount.com"]
    "api-token"   = ["my-app-sa@${var.project_id}.iam.gserviceaccount.com"]
  }
}

module "gke" {
  source         = "../../modules/gke"
  project_id     = var.project_id
  region         = var.region
  cluster_name   = "gke-${var.environment}"
  network        = module.vpc.network_name
  subnetwork     = module.vpc.subnet_name
  ip_range_pods     = module.vpc.pods_range_name
  ip_range_services = module.vpc.services_range_name
  gke_sa_email   = module.iam.gke_sa_email
}

module "storage" {
  source        = "./modules/storage"
  project_id    = var.project_id
  bucket_name   = var.bucket_name
  location      = var.region
  kms_key_name  = var.kms_key_name
}

module "monitoring" {
  source                = "./modules/monitoring"
  notification_channels = var.notification_channels
}

