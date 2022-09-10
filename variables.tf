variable "region" {
  type        = string
  default     = "ap-southeast-2"
  description = "AWS region https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html"
}

variable "acm_certificate_arn" {
  type        = string
  default     = null
  description = "ARN of SSL certificate in ACM"
}

variable "s3_bucket_cdn_log" {
  type        = string
  default     = null
  description = "Name of S3 bucket for storing CDN log"
}

variable "s3_bucket_site" {
  type        = string
  default     = null
  description = "Name of S3 bucket for storing web site content"
}

variable "enable_s3_bucket_extras" {
  type        = bool
  default     = false
  description = "Enable the provisioning of S3 bucket for extra files"
}

variable "s3_bucket_extras" {
  type        = string
  default     = "kon-tiki-s3-bucket-extras"
  description = "Name of S3 bucket for storing extra files"
}

variable "route53_domain" {
  type        = string
  default     = null
  description = "Route53 record to be used as the domain name of the web site"
}

variable "route53_zone_id" {
  type        = string
  default     = null
  description = "Route53 hosted zone ID where the domain will be added to"
}

variable "enable_route53_domain_proxy" {
  type        = bool
  default     = false
  description = "Enable the provisioning of Route53 CNAME record proxy"
}

variable "route53_domain_proxy" {
  type        = string
  default     = "kon-tiki-route53-domain-proxy"
  description = "Name of Route53 CNAME record which will proxy inbound requests prior to reaching the CDN"
}

variable "enable_lambda_viewer_request" {
  type        = bool
  default     = false
  description = "Enable the provisioning of CloudFront Lambda Edge viewer request"
}

variable "lambda_viewer_request_arn" {
  type        = string
  default     = "kon-tiki-lambda-viewer-request-arn"
  description = "ARN of Lambda Function to be used as viewer-request CloudFront Lambda@Edge"
}

variable "enable_lambda_origin_request" {
  type        = bool
  default     = false
  description = "Enable the provisioning of CloudFront Lambda Edge origin request"
}

variable "lambda_origin_request_arn" {
  type        = string
  default     = "kon-tiki-lambda-origin-request-arn"
  description = "ARN of Lambda Function to be used as origin-request CloudFront Lambda@Edge"
}

variable "tags" {
  type        = object
  default     = {
    project = "kon-tiki"
  }
  description = "Tags to be added to all taggable AWS resources provisioned by Terraform Kon-Tiki"
}