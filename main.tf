terraform {
  # Terragrunt will fully configure this backend at run time.
  # See the docs for Terraform Backend Partial Configuration for more details:
  # https://www.terraform.io/docs/backends/config.html#partial-configuration
  backend "s3" {}
}

provider "aws" {
  region = "${var.aws_region}"
}

# Load the public subnet to use from the remote state of the VPC module
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket     = "${var.vpc_remote_state_bucket}"
    key        = "${var.vpc_remote_state_key}"
    region     = "${var.vpc_remote_state_region}"
    encrypt    = "${var.vpc_remote_state_encrypt}"
    lock_table = "${var.vpc_remote_state_lock_table}"
  }
}

resource "aws_instance" "web" {
  count = "${var.instance_count}"

  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${element(data.terraform_remote_state.vpc.public_subnet_ids, count.index)}"

  tags {
    Name = "terragrunt_sample_frontend_app instance"
  }
}
