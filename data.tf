data "aws_iam_policy_document" "logger" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObjectAcl",
      "s3:PutObjectAcl",
    ]

    resources = [
      "${aws_s3_bucket.log_bucket.arn}",
      "${aws_s3_bucket.log_bucket.arn}/*",
    ]
  }
}