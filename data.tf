data "azurerm_managed_api" "api" {
  name     = "servicebus"
  location = var.location
}
data "local_file" "logic_app" {
  filename = "../../modules/jenkins-webhook-relay/workflow.json"
}