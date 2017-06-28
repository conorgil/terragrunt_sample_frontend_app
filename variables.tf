variable "aws_region" {
  type        = "string"
  description = "The AWS region in which to create the VPC."
  default     = "us-east-1"
}

variable "instance_count" {
  type        = "string"
  description = "How many servers to run."
}

variable "instance_type" {
  type        = "string"
  description = "What kind of servers to run (e.g. t2.large)."
}

variable "ami_id" {
  type        = "string"
  description = "The ID of the AMI to use when creating the EC2 instance(s)."
}

variable "vpc_remote_state_bucket" {
  type        = "string"
  description = "The name of the bucket to use for the vpc terraform_remote_state."
}

variable "vpc_remote_state_key" {
  type        = "string"
  description = "The name of the key to use for the vpc terraform_remote_state."
}

variable "vpc_remote_state_lock_table" {
  type        = "string"
  description = "The name of the DynamoDB table to use for the vpc terraform_remote_state."
}

variable "vpc_remote_state_region" {
  type        = "string"
  description = "The name of the aws region to use for the vpc terraform_remote_state."
  default     = "us-east-1"
}

variable "vpc_remote_state_encrypt" {
  type = "string"

  # Q: Is this needed when using terraform_remote_state? SSE is already enabled
  # on the object in the bucket, so I don't think this does anything in this context.
  description = "Whether the remote state file uses server side encryption or not."

  default = "true"
}
