terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "cloudops_info" {
  filename = "${path.module}/cloudops-info.txt"

  content = <<-EOT
    Project: ${var.project_name}
    Environment: ${var.environment}
    Message: ${var.project_message}
  EOT
}

output "created_file" {
  value = local_file.cloudops_info.filename
}

output "project_environment" {
  description = "The environment being deployed"
  value       = var.environment
}
