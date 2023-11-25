output "frontend_app_endpoint" {
  value = aws_s3_bucket.webapp.website_endpoint
}