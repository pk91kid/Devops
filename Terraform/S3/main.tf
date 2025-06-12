provider "aws" {
  region = "ap-south-1" # Change to your desired region
}

module "s3_bucket" {
  source            = "./modules"
  bucket_name       = var.bucket_name
  force_destroy     = var.force_destroy
  versioning_enabled = var.versioning_enabled
  tags              = var.tags
}

