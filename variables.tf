variable "bucket_name" {
  type = string
  default = ""
}
variable "bucket_tag_name" {}
variable "environment" {
  default = "dev"
  type = string
}
variable "s3_force_destroy" {
  type = bool
  default = false
}
