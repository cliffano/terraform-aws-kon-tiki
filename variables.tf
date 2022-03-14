variable "acm_certificate_arn" {
  type        = string
  default     = null
  description = ""
}

variable "bucket_cdn_log" {
  type        = string
  default     = null
  description = ""
}

variable "bucket_site" {
  type        = string
  default     = null
  description = ""
}

variable "bucket_gallery" {
  type        = string
  default     = null
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

