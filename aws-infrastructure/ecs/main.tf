resource "aws_ecr_repository" "container_registry" {
  for_each = var.environments
  name                 = "${each.value}-terraform-playground-registry"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = var.project_name
    Environment = each.value
  }
}