data "aws_region" "current" {}

data "aws_canonical_user_id" "this" {

}

data "aws_caller_identity" "current" {}
locals {
  s3_origin_id = "cfhost123"
  buckets = {
      "cfhost123" = {
        environment = "cfhost123"
        s3_force_destroy = true
        bucket_tag_name = "cfhost"
      },
      "cflogger123" = {
        environment = "devcf"
        s3_force_destroy = true
        bucket_tag_name = "cflogger123"   
      }
   }

}
resource "aws_s3_bucket" "bucket" {
  for_each = local.buckets
  bucket = each.key
  force_destroy = each.value.s3_force_destroy
  tags = {
    Name        = each.value.bucket_tag_name
    Environment = each.value.environment
  }
}

