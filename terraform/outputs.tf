output "environment_name" {
  description = "The deployed environment name"
  value       = var.environment
}

output "deployment_name" {
  description = "The full deployment name"
  value       = local.deployment_name
}

output "web_server_id" {
  description = "EC2 instance ID (prod only)"
  value       = var.environment == "prod" ? aws_instance.web[0].id : null
}

output "database_endpoint" {
  description = "RDS endpoint (prod only)"
  value       = var.environment == "prod" ? aws_db_instance.database[0].endpoint : null
}
