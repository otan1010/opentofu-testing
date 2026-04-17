# Generate an AZ provider block
generate "az_provider" {
  path      = "az_entra_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
}
EOF
}

