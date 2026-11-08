module "network" {
  source = "../../modules/network"

  subnet_id        = var.subnet_id
  ssh_allowed_cidr = var.ssh_allowed_cidr
}

module "compute" {
  source = "../../modules/compute"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.network.subnet_id
  security_group_id = module.network.security_group_id
  key_name          = var.key_name
}
