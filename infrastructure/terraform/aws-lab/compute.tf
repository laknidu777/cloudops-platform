module "compute" {
  source = "./modules/compute"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.network.subnet_id
  security_group_id = module.network.security_group_id
  key_name          = var.key_name
}

moved {
  from = aws_instance.terraform_lab
  to   = module.compute.aws_instance.terraform_lab
}
