# Generate an DBX provider block
generate "dbx_workspace_provider" {
  path      = "databricks_workspace_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "databricks" {
  alias = "workspace_level"
  host = azurerm_databricks_workspace.this.workspace_url
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id
}
EOF
}
