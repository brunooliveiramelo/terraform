Configure the AWS Provider
provider "aws" {

  shared_config_files      = [var.aws_config_files]
  shared_credentials_files = [var.aws_credentials_files]
  region                   = var.aws_region
  profile                  = var.aws_profile
}

Create EC2 instance
resource "aws_instance" "terra_ec2" {
  ami           = var.aws_ami
  instance_type = var.aws_instance
  count = 2
  tags = {
    Name = var.servers_name[count.index]
  }
}

resource "aws_eip" "lb" {
  vpc = true
}

resource "aws_eip_association" "aws_eip_assoc" {
  instance_id   = aws_instance.terra_ec2.id
  allocation_id = aws_eip.lb.id
}

output "my-instance_id" {
  value = aws_eip_association.aws_eip_assoc.public_ip
}
output "my-allocation_id" {
  value = aws_eip_association.aws_eip_assoc.public_ip
}


resource "aws_security_group" "allow_tls" {
  name = "brunolab-security-group"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }
}