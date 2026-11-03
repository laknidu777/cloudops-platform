output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.terraform_lab.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.terraform_lab.public_ip
}

output "private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.terraform_lab.private_ip
}
