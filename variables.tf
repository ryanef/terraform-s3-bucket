variable bucket_acl_permission {
  type = string
  default = "FULL_CONTROL"
}

variable "bucket_ownership_control" {
  default = "BucketOwnerPreferred"
  type = string
}

variable "bucket_name" {
  type = string

}
variable "bucket_name_log" {
    type = string
}
variable "bucket_tag_name" {
  default = "devbuckettf"
}
variable "bucket_tag_name_log" {
  default = "devlogbucket"
}
variable "environment" {
  default = "dev"
  type = string
}
variable "s3_force_destroy" {
  type = bool
  default = false
}
