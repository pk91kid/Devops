output "docker_host_ip" {
  value = aws_instance.docker_host.public_ip
}

output "private_key_pem" {
  value     = tls_private_key.mykey.private_key_pem
  sensitive = true
}
