variable "bucket_name" {
  type = string
}

variable "force_destroy" {
  type    = bool
  default = false
}

variable "versioning_enabled" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}

