output "logicapp-trigger-endpoint" {
  value = jsondecode(azurerm_resource_group_template_deployment.logic_app_deployment.output_content).callbackUrl.value
}
output "apiconnection_id" {
  value = data.azurerm_managed_api.api.id
}