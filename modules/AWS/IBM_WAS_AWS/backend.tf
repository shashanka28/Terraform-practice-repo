terraform {
  backend "s3" {
    bucket = "s3-bucket-name"
    key = "path-to-state-file-in-s3-bucket"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "dynamodb-table-for-terraform-state-locking-mechanism"
  }
}