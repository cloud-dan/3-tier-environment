data "azurerm_resource_group" "this" {
  name = format("%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code)
}

data "azurerm_virtual_network" "this" {
  name                = format("%s-%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code, "vnt")
  resource_group_name = data.azurerm_resource_group.this.name
}

resource "azurerm_subnet" "this" {
  for_each = toset(var.subnet_names)

  name                 = each.value
  resource_group_name  = data.azurerm_resource_group.this.name
  virtual_network_name = data.azurerm_virtual_network.this.name
  address_prefix       = "10.0.1.0/24"

}
