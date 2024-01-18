data "aws_region" "current" {}

data "aws_canonical_user_id" "this" {

}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "bucket" {
  
  bucket = var.bucket_name
  force_destroy = var.s3_force_destroy
  tags = {
    Name        = var.bucket_tag_name
    Environment = var.environment
  }
}

