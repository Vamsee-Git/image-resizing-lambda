resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_exec_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.s3_bucket}/*",
          "arn:aws:s3:::${var.processed_bucket}/*"
        ]
      },
      {
        Action = "sns:*"
        Effect = "Allow"
        Resource = var.sns_topic_arn
      }
    ]
  })
}

resource "aws_lambda_function" "image_processor" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  timeout       = 45 
  filename      = "./function/lambda_function.zip"
  source_code_hash = filebase64sha256("./function/lambda_function.zip")
}

resource "aws_lambda_permission" "allow_s3_to_invoke" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.s3_bucket}"  # S3 bucket ARN
  function_name = aws_lambda_function.image_processor.function_name
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.s3_bucket

  lambda_function {
    lambda_function_arn = aws_lambda_function.image_processor.arn
    events = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3_to_invoke]  # Ensure permission is created before the notification
}

output "lambda_function_name" {
  value = aws_lambda_function.image_processor.function_name
}
