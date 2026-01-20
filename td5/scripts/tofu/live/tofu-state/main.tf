provider "aws" {
  region = "eu-west-3"
}

module "state" {
  source = "../../modules/state-bucket"

  # TODO: fill in your own bucket name!
  name = "bucket1"
}