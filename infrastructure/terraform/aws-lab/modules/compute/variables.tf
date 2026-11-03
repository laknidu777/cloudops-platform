variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet where the EC2 instance will run"
  type        = string
}

variable "security_group_id" {
  description = "Security group attached to the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}
