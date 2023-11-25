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
  region = "us-east-2"
}
