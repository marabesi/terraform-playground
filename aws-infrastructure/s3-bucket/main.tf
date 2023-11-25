resource "aws_s3_bucket" "webapp" {
  for_each = var.environments
  bucket = "${each.value}-frontend-app-playground"
  tags = {
    Name        = var.project_name
    Environment = each.value
  }
}

resource "aws_s3_bucket_ownership_controls" "webapp_ownership" {
  for_each = var.environments
  bucket = aws_s3_bucket.webapp[each.value].id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "webapp_access_block" {
  for_each = var.environments
  bucket = aws_s3_bucket.webapp[each.value].id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "webapp_public_read" {
  depends_on = [
    aws_s3_bucket_ownership_controls.webapp_ownership,
    aws_s3_bucket_public_access_block.webapp_access_block,
  ]

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

resource "aws_s3_object" "webapp_static_file" {
  for_each = var.environments
  bucket = aws_s3_bucket.webapp[each.value].id

  key    = "index.html"
  source = "s3-bucket/index.html"
}