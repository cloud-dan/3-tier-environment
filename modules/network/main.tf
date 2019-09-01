data "azurerm_resource_group" "this" {
  name = format("%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code)
}

resource "azurerm_virtual_network" "this" {
  name                = lower(format("%s-%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code, "VNT"))
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    product     = var.product
    environment = var.environment
    instance    = var.instance
    region_code = var.region_code
    cost_code   = "abc123"
  }
}
