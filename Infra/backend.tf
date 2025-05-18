terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "terraform-state-backend-vamsee"
    key          = "terraform/image-resize/statefile"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

