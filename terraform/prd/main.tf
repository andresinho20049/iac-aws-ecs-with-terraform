module "prod" {
  source = "../"

  enviroment = "production"
}

output "dns_name_prod" {
  value = module.prod.lb_dns  
}