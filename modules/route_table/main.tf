data "azurerm_resource_group" "this" {
  name = format("%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code)
}

data "azurerm_virtual_network" "this" {
  name                = lower(format("%s-%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code, "vnt"))
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  virtual_network_name = format("%s-%s", data.azurerm_resource_group.this.name, "VNT")
  resource_group_name  = data.azurerm_resource_group.this.name
}

data "azurerm_subnet" "web" {
  name                 = "WebSubnet"
  virtual_network_name = format("%s-%s", data.azurerm_resource_group.this.name, "VNT")
  resource_group_name  = data.azurerm_resource_group.this.name
}

data "azurerm_subnet" "app" {
  name                 = "AppSubnet"
  virtual_network_name = format("%s-%s", data.azurerm_resource_group.this.name, "VNT")
  resource_group_name  = data.azurerm_resource_group.this.name
}

data "azurerm_subnet" "data" {
  name                 = "DataSubnet"
  virtual_network_name = format("%s-%s", data.azurerm_resource_group.this.name, "VNT")
  resource_group_name  = data.azurerm_resource_group.this.name
}

resource "azurerm_route_table" "this" {
  for_each = toset(var.route_tables)

  name                = lower(format("%s-%s-%s", data.azurerm_resource_group.this.name, "RTE", each.key))
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
}
