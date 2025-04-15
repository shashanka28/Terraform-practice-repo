output "api_server_url" {
  value = azurerm_redhat_openshift_cluster.aro.apiserver_url
}

output "console_url" {
  value = azurerm_redhat_openshift_cluster.aro.console_url
}