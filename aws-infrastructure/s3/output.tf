output "frontend_app_endpoint" {
  value = [
    for environment in aws_s3_bucket.webapp : environment.website_endpoint
  ]
}