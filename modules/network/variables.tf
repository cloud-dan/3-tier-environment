# variables
variable "cloud_environment" {
  description = "The cloud environment which should be used"
  default = "public"
}
variable "tenant_id" {
  description = "The tenant ID"
}
variable "subscription_id" {
  description = "The subscription ID"
}
variable "client_id" {
  description = "The service principal client ID"
}
variable "client_secret" {
  description = "The service principal client secret"
}
# network specific variables
variable "company" {
  description = "The 3 letter company acronym e.g. CON for Contoso"
  default     = "CSO"
}
variable "product" {
  description = "The 3 letter product acronym e.g. FAB for Fabrikam Fiber"
  default     = "FAB"
}
variable "environment" {
  description = "The 3 letter environment acronym"
  default     = "DEV"
}
variable "region_code" {
  description = "The 3 letter region acronym e.g EUW for West Europe"
  default     = "EUW"
}
variable "instance" {
  description = "The instance number of the environment"
  default     = "01"
}
