output "administrator_role_arn" {
  value = "${module.admin_role.arn}"
  description = "Amazon Resource Number (ARN) of the IAM Role in the administrator account"
}

output "executor_role_name" {
  value = "${var.executor_role_name}"
  description = "Name of the IAM Role in all target accounts for Stack Set operations"
}

output "" {
  value = ""
}