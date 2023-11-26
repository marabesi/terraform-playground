resource "aws_apprunner_service" "backend_api" {
  service_name = "example"

  source_configuration {
    image_repository {
      image_configuration {
        port = "8080"
      }
#      image_identifier      = "public.ecr.aws/aws-containers/hello-app-runner:latest"
      image_identifier      = var.image_identifier
      image_repository_type = "ECR_PUBLIC"
    }
    auto_deployments_enabled = false
  }

  tags = var.tags
}