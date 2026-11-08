variable "ami_id" {
  description = "AMI ID for the development EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for development"
  type        = string
}

variable "subnet_id" {
  description = "Subnet for the development EC2 instance"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "IP range allowed to SSH into development"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}
