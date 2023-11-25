terraform {
  backend "remote" {
    organization = "maraba"

    workspaces {
      name = "terraform-playground"
    }
  }
  required_providers {
    aws = {
      version = "~> 5.26.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "webapp" {
  for_each = var.environments
  bucket = "${each.value}-frontend-app-playground"

  tags = {
    Name        = var.project_name
    Environment = each.value
  }
}