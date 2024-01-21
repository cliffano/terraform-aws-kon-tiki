output "s3_bucket_site" {
  value       = aws_s3_bucket.site
  description = "Provisioned S3 bucket resource"
}

output  "cloudfront_distribution_cdn" {
  value       = aws_cloudfront_distribution.cdn
  description = "Provisioned CloudFront distribution resource"
}

output  "route53_record_domain" {
  value       = aws_route53_record.domain
  description = "Provisioned Route53 record resource"
}
