variable "acm_certificate_arn" {
  type        = string
  default     = null
  description = ""
}

variable "s3_bucket_cdn_log" {
  type        = string
  default     = null
  description = ""
}

variable "s3_bucket_site" {
  type        = string
  default     = null
  description = ""
}

variable "s3_bucket_gallery" {
  type        = string
  default     = null
  description = ""
}

variable "enable_s3_bucket_gallery" {
  type        = bool
  default     = false
  description = ""
}

variable "lambda_origin_request_arn" {
  type        = string
  default     = null
  description = ""
}

variable "region" {
  type        = string
  default     = null
  description = ""
}

variable "route53_domain_name" {
  type        = string
  default     = null
  description = ""
}

variable "route53_domain_zoneid" {
  type        = string
  default     = null
  description = ""
}

variable "route53_domain_alias_name" {
  type        = string
  default     = null
  description = ""
}

variable "route53_domain_alias_zoneid" {
  type        = string
  default     = null
  description = ""
}

