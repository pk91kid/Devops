provider "aws" {
  region = "ap-south-1"
}

module "docker_host" {
  source = "../modules"

  vpc_id     = "vpc-0f60ee96d2cbf3f41"
  subnet_id  = "subnet-0e1d1f660814ff3a8"
  ami_id     = "ami-080270a5eef82c973"
  instance_type = "t2.micro"
  cidr_blocks = ["0.0.0.0/0"]
}
output "docker_host_ip" {
  value = module.docker_host.docker_host_ip
}

output "private_key_pem" {
  value     = module.docker_host.private_key_pem
  sensitive = true
}

