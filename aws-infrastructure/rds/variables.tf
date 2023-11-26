variable "environments" {
  type = set(string)
  default = []
}

variable "project_name" {
  type = string
  default = ""
}

variable "rds_root_username" {
  sensitive = true
  type = string
}

variable "rds_root_password" {
  sensitive = true
  type = string
}
