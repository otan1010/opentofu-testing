# Set subscription-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# root.hcl configuration.
locals {
  subscription_name   = "dbx-demo-prod"
  aws_subscription_id = "b3ae52fb-299b-4a89-b68d-8b5fd22066cc"
}
