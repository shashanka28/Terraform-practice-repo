resource "azurerm_dns_zone" "dns_zone" {
  name = var.domain_name
  resource_group_name = var.resource_group
}

resource "azurerm_key_vault" "kv" {
  name = "${var.environment}-kv"
  location = var.location
  resource_group_name = var.resource_group
  tenant_id = var.tenant_id
  sku_name = "Standard"
}

resource "azurerm_key_vault_certificate" "ssl_cert" {
  name = "${var.environment}-ssl-cert"
  key_vault_id = azurerm_key_vault.kv.id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size = 2048
      key_type = "RSA"
      reuse_key = true
    }

    secret_properties {
      content_type = "application/x-pkc12"
    }

    x509_certificate_properties {
      validity_in_months = 12
      subject = "CN=${var.domain_name}"
      key_usage = [
        "digitalSignature",
        "keyEncipherment",
        "dataEncipherment"
      ]
    }
  }
}