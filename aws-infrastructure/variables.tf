variable "aws_region" {
  type = string
  default = "us-east-2"
}

variable "environments" {
  type = set(string)
  default = ["dev"]
}

variable "project_name" {
  type = string
  default = "terraform-playground"
}

variable "rds_root_username" {
  sensitive = true
  type = string
}

variable "rds_root_password" {
  sensitive = true
  type = string
}
