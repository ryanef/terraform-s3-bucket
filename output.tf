output "s3_bucket_id" {

  value       = {for key, value in aws_s3_bucket.bucket: key=>"${value.id}" }
}


output "s3_bucket_arn" {

  value       = try({for key, value in aws_s3_bucket.bucket: key=>"${value.arn}" }, {}) 
}

output "s3_bucket_regional_domain_name" {

  value       = try({for key, value in aws_s3_bucket.bucket: key=>"${value.bucket_regional_domain_name}"}, {}) 
}

output "s3_bucket_domain_name" {
  description = "formatted like: bucketname.s3.amazonaws.com."
  value       = try({for key, value in aws_s3_bucket.bucket: key=>"${value.bucket_domain_name}"}, {}) 
}