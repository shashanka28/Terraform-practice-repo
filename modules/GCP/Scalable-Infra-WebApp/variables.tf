variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region where resources will be created"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone where resources will be created"
  type        = string
  default     = "us-central1-a"
}


variable "user_email" {
  description = "The GCP user email info"  
  type = string
}