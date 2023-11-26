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
#  source = "./s3"
#  environments = var.environments
#  project_name = var.project_name
#}

#module "containers"  {
#  source = "./ecr"
#
#  environments = var.environments
#  project_name = var.project_name
#}

#module "database" {
#  source = "./rds"
#  environments = var.environments
#  project_name = var.project_name
#  rds_root_username = var.rds_root_username
#  rds_root_password = var.rds_root_password
#}