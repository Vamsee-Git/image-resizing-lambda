variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type = string
}

variable "s3_bucket" {
  description = "Name of the S3 bucket for original images"
  type = string
}

variable "processed_bucket" {
  description = "Name of the S3 bucket for processed images"
  type = string
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic"
  type = string
}
