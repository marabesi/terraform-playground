variable "tags" {
  type = map(string)
  default = {}
}

variable "image_identifier" {
  type = string
  default = ""
}

variable "environment" {
  type = string
}