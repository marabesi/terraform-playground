# https://medium.com/kocsistem/how-to-deploy-docker-image-to-aws-app-runner-with-terraform-5048eecff047
# https://prashant-48386.medium.com/terraform-deploy-docker-image-on-aws-apprunner-from-ecr-repository-8ed5423bf3d4
resource "aws_iam_role" "apprunner_role" {
  name = "apprunner_role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": [
            "build.apprunner.amazonaws.com",
            "tasks.apprunner.amazonaws.com"
          ]
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "apprunner_policy" {
  role = aws_iam_role.apprunner_role.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}

resource "time_sleep" "waitrolecreate" {
  depends_on = [aws_iam_role.apprunner_role]
  create_duration = "60s"
}

resource "aws_apprunner_service" "backend_api" {
  depends_on = [time_sleep.waitrolecreate]

  service_name = "${var.environment}-backend-api"

  health_check_configuration {
    protocol = "HTTP"
    path = "/"
  }

  instance_configuration {
    memory = "512"
    cpu = "256"
  }

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_role.arn
    }
    image_repository {
      image_configuration {
        port = "8080"
      }
      image_identifier      = var.image_identifier
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = false
  }

  tags = var.tags
}