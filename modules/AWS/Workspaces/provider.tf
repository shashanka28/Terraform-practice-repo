terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"  # Your desired region
}

provider "aws" {
  alias  = "prod"
  region = "us-east-1"  # Specify the region for the prod environment
}
