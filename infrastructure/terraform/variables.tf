variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "CloudOps Platform"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

variable "project_message" {
  description = "Message written into the project file"
  type        = string
  default     = "Infrastructure managed by Terraform!"
}
