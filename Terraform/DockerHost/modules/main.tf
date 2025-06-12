resource "aws_security_group" "docker_sg" {
  name        = "docker_sg"
  description = "Allow SSH and Docker TCP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
  ingress {
    from_port = 2375
    to_port = 2375
    protocol = "tcp"
    cidr_blocks = var.cidr_blocks
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

resource "tls_private_key" "mykey" {
    algorithm = "RSA"
    rsa_bits = 2048
}

resource "aws_key_pair" "generated_key" {
  key_name   = "terraform-generated-key"
  public_key = tls_private_key.mykey.public_key_openssh
}


resource "aws_instance" "docker_host" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
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

