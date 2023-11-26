resource "aws_db_instance" "database" {
  for_each = var.environments
  allocated_storage    = 10
  # https://developer.hashicorp.com/terraform/language/functions/replace
  db_name              = "${each.value}${replace(var.project_name, "-", "")}"
  engine               = "postgres"
  engine_version       = "14"
  instance_class       = "db.t3.micro"
  username             = var.rds_root_username
  password             = var.rds_root_password
  skip_final_snapshot  = true
  deletion_protection = false
}