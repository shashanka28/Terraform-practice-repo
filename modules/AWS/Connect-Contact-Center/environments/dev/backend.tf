terraform {
  backend "s3" {
    bucket         = "my-connect-tfstate"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks" # in s3, we have use_lockfile = true
  }
}
