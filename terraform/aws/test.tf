provider "aws" {
#   region = eu-central-1
}

resource "aws_ssm_parameter" "name" {
  name = "ami_id"
  type = "SecureString"
  value = data.aws_ami.ubuntu
}

data "aws_availability_zones" "current" {}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_ami" "ubuntu" {
  owners = [ "amazon" ]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

output "aws_ami_ubuntu" {
  value = data.aws_ami.ubuntu.id
}

output "data_aws_availability_zones" {
  value = data.aws_availability_zones.current.names
}

output "data_caller_identity" {
  value = data.aws_caller_identity.current.account_id
}

output "data_aws_region" {
  value = data.aws_region.current.name
}