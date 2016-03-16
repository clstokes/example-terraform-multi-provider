variable "one_aws_access_key" {}
variable "one_aws_secret_key" {}

variable "two_aws_access_key" {}
variable "two_aws_secret_key" {}

provider "aws" {
  alias      = "account_one"
  region     = "us-east-1"
  access_key = "${var.one_aws_access_key}"
  secret_key = "${var.one_aws_secret_key}"
}

provider "aws" {
  alias      = "account_two"
  region     = "us-west-2"
  access_key = "${var.two_aws_access_key}"
  secret_key = "${var.two_aws_secret_key}"
}

resource "aws_security_group" "one_allow_all" {
  provider    = "aws.account_one"
  name        = "allow_all"
  description = "Allow all inbound traffic"
}

resource "aws_security_group" "two_allow_all" {
  provider    = "aws.account_two"
  name        = "allow_all"
  description = "Allow all inbound traffic"
}
