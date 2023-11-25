resource "aws_s3_bucket" "webapp" {
  for_each = var.environments
  bucket = "${each.value}-frontend-app-playground"
  tags = {
    Name        = var.project_name
    Environment = each.value
  }
}