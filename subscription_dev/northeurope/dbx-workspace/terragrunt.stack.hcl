#locals {
#  name = "res_grp_demo1"
#}

unit "resource_group" {
  source = "git::https://github.com/otan1010/dbx-iac-modules-demo1.git//units/resource_group"
  path = "res_grp1"
}

unit "resource_group" {
  source = "git::https://github.com/otan1010/dbx-iac-modules-demo1.git//units/resource_group"
  path = "res_grp2"
}
