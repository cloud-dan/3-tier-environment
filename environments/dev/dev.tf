module "resource_group" {
  source = "../../modules/resource_group"

  company     = "CSO"
  product     = "FAB"
  environment = "DEV"
  instance    = "01"
  region_code = "EUW"

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

module "network" {
  source = "../../modules/network"

  company     = "CSO"
  product     = "FAB"
  environment = "DEV"
  instance    = "01"
  region_code = "EUW"

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

module "subnets" {
  source = "../../modules/subnets"

  company     = "CSO"
  product     = "FAB"
  environment = "DEV"
  instance    = "01"
  region_code = "EUW"

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

module "web_vm" {
  source = "../../modules/vm"

  company     = "CSO"
  product     = "FAB"
  environment = "DEV"
  instance    = "01"
  region_code = "EUW"
  vm_role     = "WEB"
  vm_count    = 1
  vm_subnet   = "Web"

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  vm_local_password = var.vm_local_password
}
