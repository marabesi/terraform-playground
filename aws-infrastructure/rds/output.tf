output "endpoint" {
  value = [
    for environment in aws_db_instance.database: environment.endpoint
  ]
}

output "database_name" {
  value = [
    for environment in aws_db_instance.database: environment.db_name
  ]
}
