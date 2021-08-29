variable "docker_host" {
  default     = "localhost"
  description = "docker host name or ip to connect to"
  type        = string
}

variable "docker_user" {
  default = "pi"
  type = string
}

variable "docker_password" {
  default = "raspberry"
  type = string
  sensitive = true
}

variable "docker_port" {
  default = 22
  type = number
}