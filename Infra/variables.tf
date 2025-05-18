variable "region" {
  description = "AWS Region"
  type        = string
}

variable "original_bucket_name" {
  description = "Name of the bucket for original images"
  type        = string
}

variable "processed_bucket_name" {
  description = "Name of the bucket for processed images"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "sns_topic_email" {
  description = "Email address for SNS notifications"
  type        = string
}
