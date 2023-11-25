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