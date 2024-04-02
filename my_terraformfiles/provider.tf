# The terraform block settings

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
  # The backend is to store my terraform state files (you can use any cloud provider you want)
  backend "s3" {
    bucket = "multi-tier-architecture-bucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

# The provider block
provider "aws" {
  profile = "default"
  region  = var.region_name
}