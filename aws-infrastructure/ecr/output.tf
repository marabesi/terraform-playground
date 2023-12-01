output "container_registry_url" {
  value = tomap({
    for k, g in aws_ecr_repository.container_registry : k => g.repository_url
  })
}