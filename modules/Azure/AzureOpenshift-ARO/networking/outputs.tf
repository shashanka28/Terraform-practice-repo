output "subnet_id" {
  value = azurerm_subnet.aro_subnet.id
}

output "network_id" {
  value = azurerm_virtual_network.vnet.id
}