terraform {
  backend "remote" {
    organization = "maraba"

    workspaces {
      name = "terraform-playground"
    }
  }
  required_providers {
    aws = {
      version = "~> 3.53.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "frontend-app-playground"

  tags = {
    Name        = "bucket"
    Environment = "frontend-app-playground"
  }
}
