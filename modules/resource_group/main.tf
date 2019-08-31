resource "azurerm_resource_group" "this" {
  name     = "testResourceGroup1"
  location = var.location

  tags = {
    environment = "Production"
  }
}