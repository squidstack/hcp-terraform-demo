output "environment_name" {
  description = "The deployed environment name"
  value       = var.environment
}

output "deployment_name" {
  description = "The full deployment name"
  value       = local.deployment_name
}
