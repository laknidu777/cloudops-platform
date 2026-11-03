output "security_group_id" {
  description = "ID of the network security group"
  value       = aws_security_group.terraform_lab.id
}

output "subnet_id" {
  description = "ID of the selected subnet"
  value       = data.aws_subnet.selected.id
}

output "vpc_id" {
  description = "ID of the default VPC"
  value       = data.aws_vpc.default.id
}
