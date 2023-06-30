resource "azurerm_resource_group" "azure_resource_group" {
  location = var.location
  name     = "github-jenkins-${var.project}-${var.env}-rg"
  tags     = var.common_tags
}

