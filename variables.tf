variable "vpn_ip" {
  default = "116.50.30.20/32"
}

# variables for Configure the AWS Provider
variable "aws_config_files" {
  type    = string
  default = "/Users/bruno/.aws/config"
}
variable "aws_credentials_files" {
  type    = string
  default = "/Users/bruno/.aws/credentials"
}
variable "aws_region" {
  default = "us-east-2"
}
variable "aws_profile" {
  default = "default"
}

# variables for Create EC2 instance
variable "aws_ami" {
  default = "ami-0c6a6b0e75b2b6ce7"
}

variable "servers_name" {
  type = list
  default = ["terraform-server1", "terraform-server2"]
}

variable "aws_instance" {
  default = "t2.micro"
}

# Github
variable "github_token" {
  default = ""
}
