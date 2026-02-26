terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
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

# Production web server (shows real costs in Infracost)
resource "aws_instance" "web" {
  count         = var.environment == "prod" ? 1 : 0
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "hcp-terraform-demo-web-${var.environment}"
    Environment = var.environment
    Owner       = "platform-team"
    CostCenter  = "engineering"
  }

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }
}

# Production RDS database (shows real costs in Infracost)
resource "aws_db_instance" "database" {
  count              = var.environment == "prod" ? 1 : 0
  identifier         = "hcp-demo-${var.environment}"
  engine             = "postgres"
  engine_version     = "15.4"
  instance_class     = var.db_instance_class
  allocated_storage  = var.db_storage_size
  storage_type       = "gp3"

  db_name  = "demodb"
  username = "dbadmin"
  password = "temp-password-change-me" # In real use, use secrets manager

  skip_final_snapshot = true

  tags = {
    Name        = "hcp-terraform-demo-db-${var.environment}"
    Environment = var.environment
    Owner       = "platform-team"
    CostCenter  = "engineering"
  }
}

locals {
  deployment_name = "hcp-terraform-demo-${var.environment}"
}
