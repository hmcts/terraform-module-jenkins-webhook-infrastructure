data "azurerm_managed_api" "api" {
  name     = "servicebus"
  location = var.location
}
data "local_file" "logic_app" {
  filename = "${path.module}/workflow.json"
}
locals {
  cft_mgmt_env = (var.env == "ptlsbox") && strcontains(var.product, "cft") ? "cftsbox-intsvc" : "cftptl-intsvc"
  sds_mgmt_env = (var.env == "ptlsbox") && strcontains(var.product, "sds") ? "sdssbox-intsvc" : "sdsptl-intsvc"
  mgmt_env     = strcontains(var.product, "sds") ? local.sds_mgmt_env : local.cft_mgmt_env
  rg_name      = strcontains(var.product, "sds") ? var.env : local.mgmt_env
}
data "azurerm_user_assigned_identity" "keda" {
  name                = "keda-${local.mgmt_env}-mi"
  resource_group_name = "managed-identities-${local.rg_name}-rg"
}
