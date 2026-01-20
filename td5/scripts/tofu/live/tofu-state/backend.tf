terraform {
  backend "s3" {
    # TODO: fill in your own bucket name here!
    bucket         = "bucket1" 
    key            = "ch5/tofu/live/tofu-state"          
    region         = "eu-west-3"                         
    encrypt        = true                                
    # TODO: fill in your own DynamoDB table name here!
    dynamodb_table = "table1" 
  }
}