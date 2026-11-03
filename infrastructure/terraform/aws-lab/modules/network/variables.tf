variable "subnet_id" {
  description = "Existing subnet ID"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Public IP range allowed to SSH"
  type        = string
}
