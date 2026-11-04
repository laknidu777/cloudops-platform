variable "aws_region" {
  description = "AWS region for our infrastructure"
  type        = string
  default     = "ap-southeast-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = "ami-01e91e94accc42eec"
}

variable "subnet_id" {
  description = "Subnet where the EC2 instance will run"
  type        = string
  default     = "subnet-0fe3bf93a16334d51"
}

variable "ssh_allowed_cidr" {
  description = "Current public IP allowed to access the server"
  type        = string
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
  default     = "cloudops-terraform-lab-key"
}
