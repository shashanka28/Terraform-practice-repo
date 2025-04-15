resource "azurerm_container_registry" "acr" {
  name = "${var.environment}acr12345"
  resource_group_name = var.resource_group
  location = var.location
  sku = "standard"
  admin_enabled = true
}


