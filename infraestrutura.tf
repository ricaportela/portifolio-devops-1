provider "aws" {
  region = "us-east-1" # Defina a região desejada
}

module "security_group" {
  source        = "./security_group"
  custom_ip     = "189.0.206.218"
}

module "ec2_instance" {
  source             = "./ec2_instance"
  key_name           = "NOME_DA_CHAVE"
  security_group_id  = module.security_group.security_group_id
}

module "elastic_ip" {
  source              = "./elastic_ip"
  instance_id         = module.ec2_instance.instance_id
  route53_domain_name = "SEU_DOMINIO"
}
