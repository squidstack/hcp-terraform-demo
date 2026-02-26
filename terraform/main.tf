terraform {
  required_version = ">= 1.0"
}

resource "null_resource" "demo" {
  triggers = {
    environment = var.environment
    timestamp   = timestamp()
  }

  provisioner "local-exec" {
    command = "echo 'Deploying to environment: ${var.environment}'"
  }
}

locals {
  deployment_name = "hcp-terraform-demo-${var.environment}"
}
