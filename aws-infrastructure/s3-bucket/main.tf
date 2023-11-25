resource "aws_s3_bucket" "webapp" {
  for_each = var.environments
  bucket = "${each.value}-frontend-app-playground"
  tags = {
    Name        = var.project_name
    Environment = each.value
  }
}

resource "aws_s3_bucket_acl" "webapp_public_read" {
  for_each = var.environments
  bucket = aws_s3_bucket.webapp[each.value].id
  acl = "public-read"
}

resource "aws_s3_bucket_website_configuration" "webapp_configuration" {
  for_each = var.environments
  bucket = aws_s3_bucket.webapp[each.value].id

  index_document {
    suffix = "index.html"
  }
}