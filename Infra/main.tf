module "s3_buckets" {
  source                = "./modules/s3"
  original_bucket_name  = var.original_bucket_name
  processed_bucket_name = var.processed_bucket_name
}

module "lambda_function" {
  source               = "./modules/lambda"
  lambda_function_name = var.lambda_function_name
  s3_bucket            = module.s3_buckets.original_bucket_name
  processed_bucket     = module.s3_buckets.processed_bucket_name
  sns_topic_arn        = module.sns_topic.sns_topic_arn
}

module "sns_topic" {
  source = "./modules/sns"
  email  = var.sns_topic_email
}
