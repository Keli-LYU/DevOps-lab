provider "aws" {
  region = "eu-west-3"
}

module "sample_app_1" {
  source = "../../modules/ec2-instance"
  ami_id = "YOUR_AMI_ID" # Replace with your AMI ID
  name = "sample-app-tofu-1"
  instance_type = "t3.micro"
  port = 8080
}

module "sample_app_2" {
  source = "../../modules/ec2-instance"
  ami_id = "YOUR_AMI_ID" # Replace with your AMI ID
  name = "sample-app-tofu-2"
  instance_type = "t3.micro"
  port = 8080
}