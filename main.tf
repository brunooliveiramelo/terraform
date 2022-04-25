terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {

  shared_config_files      = "/Users/bruno/.aws/config"
  shared_credentials_files = "/Users/bruno/.aws/credentials"
  region                   = "us-east-2"
  profile                  = "default"
}
# Create EC2 instance
resource "aws_instance" "terra_ec2" {
  ami             = "ami-0c6a6b0e75b2b6ce7"
  instance_type   = "t2.micro"
  security_groups = "sg-0777ddd4829b5aa14"
}