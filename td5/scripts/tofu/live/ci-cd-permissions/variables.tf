variable "name" {
  description = "The base name for resources"
  type        = string
  default     = "lambda-sample"
}

variable "github_repo" {
  description = "GitHub repository in the format 'username/repo'"
  type        = string
  default     = "Keli-LYU/DevOps-lab"
}

variable "tofu_state_bucket" {
  description = "S3 bucket name for storing Tofu state"
  type        = string
}

variable "tofu_state_dynamodb_table" {
  description = "DynamoDB table name for Tofu state locking"
  type        = string
}
