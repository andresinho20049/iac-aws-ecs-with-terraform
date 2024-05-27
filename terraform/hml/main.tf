module "homolog" {
  source = "../"

  enviroment = "homolog"
  region = "us-east-1"
}

output "dns_name_homolog" {
  value = module.homolog.lb_dns
}