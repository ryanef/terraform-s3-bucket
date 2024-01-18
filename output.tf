output "s3_bucket_id" {

  value       = try(aws_s3_bucket_policy.bucket.id, aws_s3_bucket.bucket.id, "")
}

output "s3_bucket_arn" {

  value       = try(aws_s3_bucket.bucket.arn, "")
}

