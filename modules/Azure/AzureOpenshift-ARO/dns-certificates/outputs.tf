output "dns_zone_name" {
  value = azurerm_dns_zone.dns_zone.name
}

output "ceritificate_thumbprint" {
  value = azurerm_key_vault_certificate.ssl_cert.thumbprint
}

