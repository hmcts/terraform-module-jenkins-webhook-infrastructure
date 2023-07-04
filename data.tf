data "azurerm_managed_api" "api" {
  name     = "servicebus"
  location = var.location
}
data "local_file" "logic_app" {
  filename = "${path.module}/workflow.json"
}
