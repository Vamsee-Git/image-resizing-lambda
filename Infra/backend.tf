terraform {
  required_version = ">= 1.5.5"

  backend "s3" {
    bucket       = "terraform-state-backend-vamsee"
    key          = "terraform/image-resize/statefile"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

