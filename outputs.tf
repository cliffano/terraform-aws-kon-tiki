output "s3_bucket_site" {
  value = aws_s3_bucket.site
}

output  "cloudfront_distribution_cdn" {
  value = aws_cloudfront_distribution.cdn
}

output  "route53_record_domain" {
  value = aws_route53_record.domain
}
