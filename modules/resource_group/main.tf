resource "azurerm_resource_group" "this" {
  name     = format("%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code)
  location = var.location

  tags = {
    environment = "Production"
  }
}