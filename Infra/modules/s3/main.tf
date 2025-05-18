resource "aws_s3_bucket" "original_images" {
  bucket = var.original_bucket_name

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "processed_images" {
  bucket = var.processed_bucket_name

  versioning {
    enabled = true
  }
}

output "original_bucket_name" {
  value = aws_s3_bucket.original_images.bucket
}

output "processed_bucket_name" {
  value = aws_s3_bucket.processed_images.bucket
}
