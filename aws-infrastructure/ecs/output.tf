output "container_registry_url" {
  value = [
    for environment in aws_ecr_repository.container_registry: environment.repository_url
  ]
}