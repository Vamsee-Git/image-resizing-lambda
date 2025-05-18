output "original_bucket_name" {
  description = "Name of the bucket for original images"
  value       = module.s3_buckets.original_bucket_name
}

output "processed_bucket_name" {
  description = "Name of the bucket for processed images"
  value       = module.s3_buckets.processed_bucket_name
}

output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = module.lambda_function.lambda_function_name
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = module.sns_topic.sns_topic_arn
}
