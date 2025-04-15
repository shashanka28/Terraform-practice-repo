resource "azurerm_redhat_openshift_cluster" "aro" {
  name = "${var.environment}-aro"
  location = var.location
  resource_group_name = var.resource_group

  cluster_profile {
    domain = var.domain
    resource_group_id = var.cluster_rg_id
    fips_enabled = false
    pull_secret = file(var.pull_secret_path)
    version = var.version
  }

  network_profile {
    pod_cidr = "10.0.0.0/14"
    service_cidr = "172.30.0.0/16"
  }

  worker_profile {
    vm_size = "Standard_D4s_v3"
    subnet_id = var.worker_subnet_id
    disk_size_gb = 128
    node_count = 3
  }

  api_server_profile {
    visibility = "Public"
  }

  ingress_profile {
    visibility = "Public"
  }

  service_principal {
    client_id = var.client_id
    client_secret = var.client_secret
  }

  main_profile {
    vm_size = "Standard_D8s_v3"
    subnet_id = var.master_subnet_id
  }

  tags = {
    environment = var.environment
  }
}