terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.51.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  shared_config_files      = ["/home/user/.aws/config"]
  shared_credentials_files = ["/home/user/.aws/credentials"]
}
