variable "prefix" {
  default = ""
}
resource "azurerm_resource_group" "intern_rg" {
  name     = "intern-${var.prefix}"
  location = "eastus"
}
