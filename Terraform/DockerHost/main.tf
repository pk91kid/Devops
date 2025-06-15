provider "aws" {
  region = "us-east-1"
}

module "docker_host" {
  source = "../modules/dockerhost"

  vpc_id     = "vpc-0238c1e19117f994b"
  subnet_id  = "subnet-0174ff4ac97ed3982"
  ami_id     = "ami-02b3c03c6fadb6e2c"
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

