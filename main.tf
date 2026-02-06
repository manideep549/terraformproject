module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  az          = "ap-south-1a"
}

module "sg" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

/**module "ec2" {
  source    = "./modules/ec2"
  subnet_id = module.vpc.subnet_id
  sg_id     = module.sg.sg_id
  key_name  = "my-keypair"
} 

module "ec2" {
  source    = "./modules/ec2"
  subnet_id = module.vpc.subnet_id
  sg_id     = module.sg.sg_id
  key_name  = aws_key_pair.ec2.key_name
} **/

module "ec2" {
  source    = "./modules/ec2"
  subnet_id = module.vpc.subnet_id
  sg_id     = module.sg.sg_id

  key_name = var.create_key ? aws_key_pair.ec2[0].key_name : var.existing_key_name
}
