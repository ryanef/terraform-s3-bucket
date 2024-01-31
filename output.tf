output "s3_bucket_id" {
  value       = aws_s3_bucket.bucket.id
}

output "s3_bucket_arn" {

  value       = aws_s3_bucket.bucket.arn
}

output "s3_log_bucket_id" {
  value = aws_s3_bucket.log_bucket.id
}
output "s3_log_bucket_arn" {
  value = aws_s3_bucket.log_bucket.arn
}


output "s3_bucket_regional_domain_name" {

  value       = aws_s3_bucket.bucket.bucket_regional_domain_name
}

output "s3_bucket_domain_name" {
  description = "formatted like: bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.bucket.bucket_domain_name 
}