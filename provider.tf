terraform {
  required_providers {
#    azapi = {
#      source  = "azure/azapi"
#      version = "=0.1.0"
#    }
#    azurerm = {
#
#    }
  }
}

provider "azurerm" {
features {}
}

provider "azuread" {
  subscription_id = "b4ea33af-e594-4e91-b202-28704622a4f5"
  tenant_id       = "d52c9ea1-7c21-47b1-82a3-33a74b1f74b8"
}
