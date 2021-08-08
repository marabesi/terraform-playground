# settinup basic provider
#provider "aws" {
#  region = "us-east-2"
#}

# require provider
terraform {
 required_providers {
    aws = {
      version = "~> 3.53.0"
    }
  }
}
