output "subnet_id" {
  value = "${data.terraform_remote_state.vpc.public_subnets[0]}"
}
