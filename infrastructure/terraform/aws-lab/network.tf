module "network" {
  source = "./modules/network"

  subnet_id        = var.subnet_id
  ssh_allowed_cidr = var.ssh_allowed_cidr
}

moved {
  from = aws_security_group.terraform_lab
  to   = module.network.aws_security_group.terraform_lab
}
