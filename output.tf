output "s3_bucket_id" {

  value       = aws_s3_bucket.bucket.id
}

output "s3_bucket_arn" {

  value       = try(aws_s3_bucket.bucket.arn, "")
}

