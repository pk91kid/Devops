provider "aws" {
  region = "us-east-1"
}
data "aws_vpc" "selected" {
  id = var.vpc_id
}
data "aws_subnet" "mysubnet" {
  vpc_id = data.aws_vpc.selected.id
}
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
module "docker_host" {
  source = "../modules/dockerhost"

  vpc_id        = var.vpc_id
  subnet_id     = data.aws_subnet.mysubnet.id
  ami_id        = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  cidr_blocks   = var.cidr_blocks
}
output "docker_host_ip" {
  value = module.docker_host.docker_host_ip
}

output "private_key_pem" {
  value     = module.docker_host.private_key_pem
  sensitive = true
}

