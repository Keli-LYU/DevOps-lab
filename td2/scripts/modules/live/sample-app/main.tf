provider "aws" {
  region = "eu-west-3"
}

locals {
  instances = {
    "sample-app-tofu-1" = {
      instance_type = "t3.micro"
      port          = 8080
    }
    "sample-app-tofu-2" = {
      instance_type = "t3.small"
      port          = 8080
    }
  }
}

module "sample_app" {
  source        = "../../modules/ec2-instance"
  for_each      = local.instances
  
  ami_id        = "YOUR_AMI_ID" # Replace with your AMI ID
  name          = each.key
  instance_type = each.value.instance_type
  port          = each.value.port
}