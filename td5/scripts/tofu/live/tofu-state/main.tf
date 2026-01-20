provider "aws" {
  region = "eu-west-3"
}

module "state" {
  source = "../../modules/state-bucket"

  # Use a unique bucket name (must be globally unique across all AWS accounts)
  name = "keli-lyu-devops-tofu-state-2026"
}