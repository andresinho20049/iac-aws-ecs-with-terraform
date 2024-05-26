module "homolog" {
  source = "../"

  enviroment = "homolog"
}

output "dns_name_homolog" {
  value = module.homolog.lb_dns
}