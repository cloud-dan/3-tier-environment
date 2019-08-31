resource "azurerm_resource_group" "this" {
  name     = format("%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code)
  location = var.location

  tags = {
    product     = var.product
    environment = var.environment
    instance    = var.instance
    region_code = var.region_code
    cost_code   = "abc123"
  }
}
