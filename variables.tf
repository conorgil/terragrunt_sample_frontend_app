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

variable "remote_state_bucket" {
  type        = "string"
  description = "The name of the bucket to use for the S3 backend."
}

variable "vpc_remote_state_key" {
  type        = "string"
  description = "The name of the key to use for the S3 backend."
}

variable "remote_state_lock_table" {
  type        = "string"
  description = "The name of the DynamoDB table to use for the S3 backend."
}

variable "remote_state_region" {
  type        = "string"
  description = "The name of the aws region to use for the S3 backend."
  default     = "us-east-1"
}

variable "vpc_remote_state_encrypt" {
  type        = "string"
  description = "Whether the S3 backend should use encryption or not."
  default     = "true"
}