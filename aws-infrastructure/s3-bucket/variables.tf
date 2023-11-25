variable "environments" {
  type = set(string)
  default = []
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "project_name" {
  type = string
  default = "terraform-playground"
}
