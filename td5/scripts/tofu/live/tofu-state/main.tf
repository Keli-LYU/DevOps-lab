provider "aws" {
  region = "eu-west-3"
}

module "state" {
  source = "https://github.com/Keli-LYU/DevOps-lab//ch5/tofu/modules/state-bucket"

  # TODO: fill in your own bucket name!
  name = "bucket1"
}