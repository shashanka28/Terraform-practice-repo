variable "identity_management_type" {
  description = "Type of identity management (e.g., SAML, CONNECT_MANAGED)"
  type        = string
  default     = "CONNECT_MANAGED"
}

variable "instance_alias" {
  description = "Alias for the Connect instance"
  type        = string
}

variable "contact_flow_name" {
  description = "Name for the default contact flow"
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}
