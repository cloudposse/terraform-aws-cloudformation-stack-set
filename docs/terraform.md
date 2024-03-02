<!-- markdownlint-disable -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_admin_role"></a> [admin\_role](#module\_admin\_role) | git::https://github.com/cloudposse/terraform-aws-iam-role.git | tags/0.4.0 |
| <a name="module_label"></a> [label](#module\_label) | git::https://github.com/cloudposse/terraform-null-label.git | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudformation_stack_set.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack_set) | resource |
| [aws_iam_policy_document.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (\_e.g.\_ "1") | `list(string)` | `[]` | no |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | A list of capabilities. Valid values: CAPABILITY\_IAM, CAPABILITY\_NAMED\_IAM, CAPABILITY\_AUTO\_EXPAND | `list(string)` | `[]` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter between `name`, `namespace`, `stage` and `attributes` | `string` | `"-"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `string` | `"true"` | no |
| <a name="input_executor_role_name"></a> [executor\_role\_name](#input\_executor\_role\_name) | Name of the IAM Role in all target accounts for Stack Set operations | `string` | `"AWSCloudFormationStackSetExecutionRole"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name | `string` | `"cis"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace (e.g. `cp` or `cloudposse`) | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Key-value map of input parameters for the Stack Set template. (\_e.g.\_ map("BusinessUnit","ABC") | `map(string)` | `{}` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage (e.g. `prod`, `dev`, `staging`) | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (\_e.g.\_ map("BusinessUnit","ABC") | `map(string)` | `{}` | no |
| <a name="input_template_url"></a> [template\_url](#input\_template\_url) | Amazon S3 bucket URL location of a file containing the CloudFormation template body. Maximum file size: 460,800 bytes | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_administrator_role_arn"></a> [administrator\_role\_arn](#output\_administrator\_role\_arn) | Amazon Resource Number (ARN) of the IAM Role in the administrator account |
| <a name="output_executor_role_name"></a> [executor\_role\_name](#output\_executor\_role\_name) | Name of the IAM Role in all target accounts for Stack Set operations |
| <a name="output_name"></a> [name](#output\_name) | Name of the Stack Set |
<!-- markdownlint-restore -->
