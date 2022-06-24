# Configure the AWS Provider
provider "aws" {

  shared_config_files      = [var.aws_config_files]
  shared_credentials_files = [var.aws_credentials_files]
  region                   = var.aws_region
  profile                  = var.aws_profile
}

variable "istest" {}

resource "aws_instance" "dev" {
  ami           = var.aws_ami
  instance_type = var.aws_instance
  count = var.istest == true ? 1 : 0
}

resource "aws_instance" "prod" {
  ami           = var.aws_ami
  instance_type = var.aws_instance
  count = var.istest == false ? 1 : 0
}