output "instance_id" {
  description = "ID of the Terraform practice EC2 instance"
  value       = module.compute.instance_id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.compute.public_ip
}

output "private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.compute.private_ip
}

output "security_group_id" {
  description = "ID of the Terraform practice security group"
  value       = module.network.security_group_id
}
