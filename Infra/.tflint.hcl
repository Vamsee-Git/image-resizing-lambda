plugin "aws" {
  enabled = true
  version = "0.29.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  region  = "us-west-2"
}
 
# Formate of output (valid values: default, compact, json)
config {
  format = "compact"
}
 
# EC2 instance must be t2.micro only
rule "aws_instance_invalid_type" {
  enabled = true
  type = "t2.micro"
}
