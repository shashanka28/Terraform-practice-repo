resource "aws_connect_instance" "this" {
  identity_management_type = var.identity_management_type
  inbound_calls_enabled    = true
  outbound_calls_enabled   = true
  instance_alias           = var.instance_alias

  tags = var.tags
}

resource "aws_connect_contact_flow" "default" {
  instance_id = aws_connect_instance.this.id
  name        = var.contact_flow_name
  type        = "CONTACT_FLOW"
  content     = file("${path.module}/flows/default_contact_flow.json")
  description = "Default contact flow for Connect"
}
