#################-----KMS-----###########################

module "kms_connect" {
  source      = "../../modules/kms"
  description = "KMS key for Amazon Connect recordings and secrets"
  alias       = "connect-kms-dev"

  tags = {
    Environment = "dev"
    Project     = "aws-connect"
  }
}


#################-----S3-----###########################

module "s3_recordings" {
  source      = "../../modules/s3"
  bucket_name = "connect-recordings-dev"
  kms_key_id  = module.kms_connect.kms_key_id

  tags = {
    Environment = "dev"
    Project     = "aws-connect"
    Purpose     = "recordings"
  }
}

#################-----DynamoDB-----###########################


module "dynamodb_sessions" {
  source        = "../../modules/dynamodb"
  table_name    = "connect-sessions-dev"
  hash_key      = "sessionId"
  kms_key_arn   = module.kms_connect.kms_key_arn

  tags = {
    Environment = "dev"
    Project     = "aws-connect"
    Purpose     = "session-tracking"
  }
}

#################-----IAM-----###########################

data "template_file" "lambda_policy" {
  template = file("${path.module}/../../modules/iam/policies/lambda_policy.json")

  vars = {
    dynamodb_table_arn = module.dynamodb_sessions.table_arn
    s3_bucket_arn      = module.s3_recordings.bucket_arn
    kms_key_arn        = module.kms_connect.kms_key_arn
  }
}

module "iam_lambda" {
  source          = "../../modules/iam"
  lambda_role_name = "connect-lambda-role-dev"
  inline_policy    = data.template_file.lambda_policy.rendered

  tags = {
    Environment = "dev"
    Project     = "aws-connect"
    Purpose     = "lambda-access"
  }
}


#################-----Lambda-----###########################

module "lambda_contact_handler" {
  source         = "../../modules/lambda"
  function_name  = "connect-session-handler-dev"
  iam_role_arn   = module.iam_lambda.lambda_role_arn

  tags = {
    Environment = "dev"
    Project     = "aws-connect"
    Purpose     = "connect-backend"
  }
}


#################-----AWS Connect-----###########################

module "connect" {
  source                 = "../../modules/connect"
  instance_alias         = "connect-dev"
  contact_flow_name      = "default-flow-dev"

  tags = {
    Environment = "dev"
    Project     = "aws-connect"
    Owner       = "infra-team"
  }
}


#################-----AWS CloudWatch-----###########################

module "cloudwatch_lambda" {
  source       = "../../modules/cloudwatch"
  lambda_name  = module.lambda_contact_handler.lambda_function_name
  tags = {
    Environment = "dev"
    Project     = "aws-connect"
  }
}
