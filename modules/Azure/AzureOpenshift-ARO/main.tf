module "networking" {
  source = "./modules/networking"
  environment = var.enviornment
}

module "identity" {
  source = "./modules/identity"
  environment = var.enviornment
}

module "acr" {
  source = "./modules/acr-registry"
  environment = var.environment
}

module "dns_cert" {
  source = "./modules/dns-certificates"
  environment = var.environment
}

module "aro_cluster" {
  source = "./modules/aro-cluster"
  environment = var.environment
}

