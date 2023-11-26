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

resource "aws_ecr_repository_policy" "ecr_policy" {
  for_each = var.environments
  repository = aws_ecr_repository.container_registry[each.value].name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "ECR permissions",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}