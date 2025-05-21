output "connect_instance_id" {
  value = aws_connect_instance.this.id
}

output "contact_flow_id" {
  value = aws_connect_contact_flow.default.id
}
