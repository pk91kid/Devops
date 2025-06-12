provider "aws" {
  region = "ap-south-1"
}

data "aws_vpc" "vpc" {
    id = "vpc-0e3d28ba8ac8586a2"
}

data "aws_subnet" "subnet" {
    id = "subnet-0baee178b37763e81"
}

resource "aws_security_group" "docker_sg" {
  name        = "docker_sg"
  description = "Allow SSH and Docker TCP"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be cautious with this in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags={
    Name = "docker-sg"
  }
}
resource "tls_private_key" "example" {
    algorithm = "RSA"
    rsa_bits = 2048
}
resource "aws_key_pair" "generated_key" {
  key_name   = "terraform-generated-key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "aws_instance" "docker_host" {
  ami           = "ami-080270a5eef82c973" # Amazon Linux 2 AMI (update as needed)
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.docker_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.generated_key.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              echo 'DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"' >> /etc/sysconfig/docker
              service docker restart
              systemctl enable docker
              EOF

  tags = {
    Name = "Terraform-Docker-Host"
  }
}
output "docker_host_ip" {
  value = aws_instance.docker_host.public_ip
}
output "private_key_pem" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}
