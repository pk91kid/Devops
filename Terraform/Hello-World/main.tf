#Hello-world!!!!!
terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "null" {}

resource "null_resource" "hello" {
  provisioner "local-exec" {
    command = "echo hello-world"
  }
}

