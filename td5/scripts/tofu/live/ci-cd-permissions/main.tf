provider "aws" {
  region = "eu-west-3" # Replace with your desired region
}

module "oidc_provider" {
  source       = "github.com/Keli-LYU/DevOps-lab//td5/scripts/tofu/modules/github-aws-oidc"
  provider_url = "https://token.actions.githubusercontent.com"
}

module "iam_roles" {
  source                         = "github.com/Keli-LYU/DevOps-lab//td5/scripts/tofu/modules/gh-actions-iam-roles"
  name                           = var.name
  oidc_provider_arn              = module.oidc_provider.oidc_provider_arn
  enable_iam_role_for_testing    = true
  enable_iam_role_for_plan       = true # Add for plan role
  enable_iam_role_for_apply      = true # Add for apply role
  github_repo                    = var.github_repo
  lambda_base_name               = var.name
  tofu_state_bucket              = var.tofu_state_bucket
  tofu_state_dynamodb_table      = var.tofu_state_dynamodb_table
}