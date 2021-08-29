terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {
  host = "ssh://${var.docker_user}:${var.docker_password}@${var.docker_host}:${var.docker_port}"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "webservice" {
  image = docker_image.nginx
  name  = "webserver"
  ports {
    internal = 80
    external = 8080
  }
}