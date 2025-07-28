terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.37.0"
      configuration_aliases = [azurerm.private_endpoint]
    }
  }
}