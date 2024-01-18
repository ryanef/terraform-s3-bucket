output "s3_bucket_id" {

  value       = [for bucket in aws_s3_bucket.bucket: bucket.id]
}

output "s3_bucket_arn" {

  value       = try(aws_s3_bucket.bucket.*.arn, "")
}

output "s3_bucket_regional_domain_name" {

  value       = try([for bucket in aws_s3_bucket.bucket: bucket.bucket_regional_domain_name], []) 
}

output "s3_bucket_domain_name" {
  description = "formatted like: bucketname.s3.amazonaws.com."
  value       = try([for bucket in aws_s3_bucket.bucket: bucket.bucket_domain_name], []) 
}