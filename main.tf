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

resource "aws_s3_bucket" "log_bucket" {
  
  bucket = var.bucket_name_log
  force_destroy = var.s3_force_destroy
  tags = {
    Name        = var.bucket_tag_name_log
    Environment = var.environment
  }
}



resource "aws_s3_bucket_policy" "bucketlog" {
  bucket = aws_s3_bucket.log_bucket.id
  policy = data.aws_iam_policy_document.logger.json
}

resource "aws_s3_bucket_ownership_controls" "acl" {
  bucket = aws_s3_bucket.log_bucket.id
  rule {
    object_ownership = var.bucket_ownership_control
  }
}

resource "aws_s3_bucket_acl" "acl" {
  depends_on = [aws_s3_bucket_ownership_controls.acl]
  bucket = aws_s3_bucket.log_bucket.id

  access_control_policy {
    grant {
      grantee {
        id = data.aws_canonical_user_id.this.id
        type = "CanonicalUser"
      }
      permission = var.bucket_acl_permission
    }
    owner {
      id = data.aws_canonical_user_id.this.id
    }
  }
}
