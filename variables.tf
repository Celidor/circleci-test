variable "region" {
  description = "AWS region to deploy Lambda functions"
  default     = "eu-west-1"
}

variable "vpc_names" {
  description = "list of VPC names - enter this variable in CircleCI (or tfvars file for local testing)"
  default     = []
  type        = list(any)
}