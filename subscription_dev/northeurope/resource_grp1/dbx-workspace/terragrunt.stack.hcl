locals {
  resource_group_vars = read_terragrunt_config(find_in_parent_folders("resource_group.hcl"))
  path = local.resource_group_vars.locals.azure_resource_group_name
}

unit "resource_group" {
  source = "git::https://github.com/otan1010/dbx-iac-modules-demo1.git//units/resource_group?ref=main"
  path = local.path
}
