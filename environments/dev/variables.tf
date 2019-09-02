# default variables
variable "cloud_environment" {
  description = "The cloud environment which should be used"
  default     = "public"
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
variable "location" {
  description = "The region the resource will be deployed to"
  default     = "West Europe"
}
variable "vm_local_password" {
    
}