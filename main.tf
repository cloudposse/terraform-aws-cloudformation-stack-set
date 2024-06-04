# Define composite variables for resources
module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

data "aws_iam_policy_document" "admin" {
  statement {
    actions   = ["sts:AssumeRole"]
    effect    = "Allow"
    resources = ["arn:aws:iam::*:role/${var.executor_role_name}"]
  }
}

module "admin_role" {
  source = "git::https://github.com/cloudposse/terraform-aws-iam-role.git?ref=tags/0.4.0"

  enabled            = var.enabled
  namespace          = var.namespace
  stage              = var.stage
  name               = var.name
  attributes         = var.attributes
  role_description   = "IAM Role for the CloudFormation administrator account."
  policy_description = "IAM Policy for the CloudFormation administrator account."

  principals = {
    Service = ["cloudformation.amazonaws.com"]
  }

  policy_documents = ["${data.aws_iam_policy_document.admin.json}"]
}

resource "aws_cloudformation_stack_set" "default" {
  count                   = var.enabled == "true" ? 1 : 0
  administration_role_arn = module.admin_role.arn
  execution_role_name     = var.executor_role_name
  name                    = module.label.id
  tags                    = module.label.tags

  capabilities = ["${var.capabilities}"]

  parameters = var.parameters

  template_url = var.template_url
}
