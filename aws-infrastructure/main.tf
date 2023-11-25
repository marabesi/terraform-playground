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

#module "frontend" {
#  source = "./s3-bucket"
#  environments = var.environments
#  project_name = var.project_name
#}