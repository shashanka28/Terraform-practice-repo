resource "azurerm_virtual_network" "vnet" {
  name = "${var.environment}-vnet"
  address_space = ["10.0.0.0/16"]
  location = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_subnet" "aro_subnet" {
  name = "aro-subnet"
  resource_group_name = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.0.0/24"]
}

