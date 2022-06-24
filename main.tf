terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }

  }
}

# Configure the AWS Provider
provider "aws" {

  shared_config_files      = ["/Users/bruno/.aws/config"]
  shared_credentials_files = ["/Users/bruno/.aws/credentials"]
  region                   = "us-east-2"
  profile                  = "default"
}

locals {
  common_tags = {
    Owner = "DevOps Team"
    service = "lab"
  }
}

# Create EC2 instance
resource "aws_instance" "terra_ec2" {
  ami             = "ami-0c6a6b0e75b2b6ce7"
  instance_type   = "t2.micro"
  tags = local.common_tags

}

resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "brnlabs-attribute"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}
