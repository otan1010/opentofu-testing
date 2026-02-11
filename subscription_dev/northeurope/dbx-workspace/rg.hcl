terraform {
  source = "git::https://github.com/otan1010/dbx-iac-modules-demo1.git//modules/resource_group?ref=main"
}

inputs {
	name = "derp"
}
