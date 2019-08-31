## AzureRM provider
provider "azurerm" {
  environment     = var.environment
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  version         = "=1.33.1"
}
