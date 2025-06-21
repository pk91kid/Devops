variable "vpc_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "cidr_blocks" {
  type = list(string)
}
