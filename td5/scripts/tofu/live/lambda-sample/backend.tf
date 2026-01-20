terraform {
  backend "s3" {
    # TODO: fill in your own bucket name here!
    bucket         = "keli-lyu-devops-tofu-state-2026" 
    key            = "ch5/tofu/live/lambda-sample"       
    region         = "eu-west-3"
    encrypt        = true
    # TODO: fill in your own DynamoDB table name here!
    dynamodb_table = "keli-lyu-devops-tofu-state-2026" 
  }
}