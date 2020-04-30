# variables.tf
variable "name" {
  default = "tst_moh"
}

variable "aws_vpc" {
  default = "vpc-0edaa98d3161736cc"
}

variable "aws_vpc_ingress" {
  default = ["0.0.0.0/0"]
}