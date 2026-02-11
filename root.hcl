# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform/OpenTofu that provides extra tools for working with multiple modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

locals {
  # Automatically load subscription-level variables
  subscription_vars = read_terragrunt_config(find_in_parent_folders("subscription.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Extract the variables we need for easy access
  subscription_name = local.subscription_vars.locals.subscription_name
  subscription_id   = local.subscription_vars.locals.azure_subscription_id
  azure_region   = local.region_vars.locals.azure_region
}

# Generate an AZ provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
  subscription_id = ["${local.subscription_id}"]
}
EOF
}

## Configure Terragrunt to automatically store tfstate files in an S3 bucket
#remote_state {
#  backend = "s3"
#  config = {
#    encrypt        = true
#    bucket         = "${get_env("TG_BUCKET_PREFIX", "")}terragrunt-example-tf-state-${local.subscription_name}-${local.azure_region}"
#    key            = "${path_relative_to_include()}/tf.tfstate"
#    region         = local.azure_region
#    dynamodb_table = "tf-locks"
#  }
#  generate = {
#    path      = "backend.tf"
#    if_exists = "overwrite_terragrunt"
#  }
#}
#
## Configure what repositories to search when you run 'terragrunt catalog'
#catalog {
#  urls = [
#    "https://github.com/gruntwork-io/terragrunt-infrastructure-catalog-example",
#    "https://github.com/gruntwork-io/terraform-azure-utilities",
#    "https://github.com/gruntwork-io/terraform-kubernetes-namespace"
#  ]
#}
