# terraform-module-jenkins-webhook-infrastructure


Terraform module for building required Jenkins Webhook relay infrastructure as code.

## Example

```hcl

module "jenkins-webhook-relay" {
  providers = {
    azurerm.private_endpoint = azurerm.private_endpoint
  }
  source                             = "git::https://github.com/hmcts/terraform-module-jenkins-webhook-infrastructure?ref=main"
  subscription_id                    = var.subscription_id
  env                                = var.env
  product                            = var.product
  location                           = var.location
  builtFrom                          = var.builtFrom
  expiresAfter                       = var.expiresAfter
  project                            = "sds" # or "cft"
  servicebus_enable_private_endpoint = var.servicebus_enable_private_endpoint
  queue_name                         = var.queue_name
  zone_redundant                     = var.zone_redundant
  enable_workflow                    = var.enable_workflow
  common_tags                        = module.tags.common_tags
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.54.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.54.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_servicebus-namespace"></a> [servicebus-namespace](#module\_servicebus-namespace) | git::https://github.com/hmcts/terraform-module-servicebus-namespace | master |
| <a name="module_servicebus-queue"></a> [servicebus-queue](#module\_servicebus-queue) | git::https://github.com/hmcts/terraform-module-servicebus-queue | master |

## Resources

| Name | Type |
|------|------|
| [azurerm_api_connection.connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_connection) | resource |
| [azurerm_logic_app_workflow.logic_app_workflow](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_workflow) | resource |
| [azurerm_resource_group.azure_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group_template_deployment.logic_app_deployment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource |
| [azurerm_role_assignment.keda_servicebus_data_receiver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_managed_api.api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/managed_api) | data source |
| [azurerm_user_assigned_identity.keda](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/user_assigned_identity) | data source |
| [local_file.logic_app](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_builtFrom"></a> [builtFrom](#input\_builtFrom) | The name of the Github repo. | `any` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tag to be applied to resources. | `map(string)` | n/a | yes |
| <a name="input_enable_workflow"></a> [enable\_workflow](#input\_enable\_workflow) | Enable workflow | `any` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Enter the environment. eg prod, aat | `any` | n/a | yes |
| <a name="input_expiresAfter"></a> [expiresAfter](#input\_expiresAfter) | Expiration date | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Enter Azure location. | `any` | n/a | yes |
| <a name="input_max_delivery_count"></a> [max\_delivery\_count](#input\_max\_delivery\_count) | Integer value which controls when a message is automatically dead lettered | `number` | `10` | no |
| <a name="input_product"></a> [product](#input\_product) | The name of the product. | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The name of the project. | `any` | n/a | yes |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | Name of the servicebus Queue. | `any` | n/a | yes |
| <a name="input_servicebus_enable_private_endpoint"></a> [servicebus\_enable\_private\_endpoint](#input\_servicebus\_enable\_private\_endpoint) | Enable private endpoint. | `any` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Enter Azure subscription id. | `any` | n/a | yes |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | Enable Zone redundancy. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apiconnection_id"></a> [apiconnection\_id](#output\_apiconnection\_id) | n/a |
| <a name="output_logicapp-trigger-endpoint"></a> [logicapp-trigger-endpoint](#output\_logicapp-trigger-endpoint) | n/a |
<!-- END_TF_DOCS -->

## Contributing

We use pre-commit hooks for validating the terraform format and maintaining the documentation automatically.
Install it with:

```shell
$ brew install pre-commit terraform-docs
$ pre-commit install
```

If you add a new hook make sure to run it against all files:
```shell
$ pre-commit run --all-files
```
