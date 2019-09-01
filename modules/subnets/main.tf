data "azurerm_resource_group" "this" {
  name = format("%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code)
}

data "azurerm_virtual_network" "this" {
  name                = lower(format("%s-%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code, "vnt"))
  resource_group_name = data.azurerm_resource_group.this.name
}

resource "azurerm_subnet" "this" {
  for_each = var.subnet_names

  name                 = format("%s%s", each.key, "Subnet")
  resource_group_name  = data.azurerm_resource_group.this.name
  virtual_network_name = data.azurerm_virtual_network.this.name
  address_prefix       = cidrsubnet("10.0.0.0/16", 8, each.value )
}