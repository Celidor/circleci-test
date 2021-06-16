resource "aws_vpc" "aws-security" {
  count      = length(var.vpc_names)
  cidr_block = "10.0.0.0/16"
  tags = {
    Name       = var.vpc_names[count.index]
    Repository = "circleci-test"
  }
}