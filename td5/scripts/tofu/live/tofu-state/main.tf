provider "aws" {
  region = "eu-west-3"
}

module "state" {
  source = "github.com/brikis98/devops-book//ch5/tofu/modules/state-bucket"

  # TODO: fill in your own bucket name!
  name = "fundamentals-of-devops-tofu-state"
}