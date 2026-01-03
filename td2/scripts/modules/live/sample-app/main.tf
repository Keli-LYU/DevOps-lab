provider "aws" {
  region = "us-east-2"
}

module "sample_app_1" {
  source = "../../modules/ec2-instance"
  ami_id = "YOUR_AMI_ID" # Replace with your AMI ID
  name = "sample-app-tofu-1"
}

module "sample_app_2" {
  source = "../../modules/ec2-instance"
  ami_id = "YOUR_AMI_ID" # Replace with your AMI ID
  name = "sample-app-tofu-2"
}