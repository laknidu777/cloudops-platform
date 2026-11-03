# Find the existing default VPC
data "aws_vpc" "default" {
  default = true
}

# Find our selected subnet
data "aws_subnet" "selected" {
  id = var.subnet_id
}

# Create a dedicated security group
resource "aws_security_group" "terraform_lab" {
  name        = "cloudops-terraform-lab-sg"
  description = "Security group for Terraform practice EC2"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH access from my public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
