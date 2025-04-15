resource "azurerm_user_assigned_identity" "aro_identity" {
  name = "${var.environment}-aro-identity"
  location = var.location
  resource_group_name = var.resource_group
}

