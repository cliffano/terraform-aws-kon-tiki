output "s3_bucket_site_arn" {
  value = aws_s3_bucket.site.arn
}

output "s3_bucket_site_id" {
  value = aws_s3_bucket.site.id
}

output "s3_bucket_site_website_domain" {
  value = aws_s3_bucket.site.website_domain
}

output  "cloudfront_distribution_cdn_arn" {
  value = aws_cloudfront_distribution.cdn.arn
}

output  "cloudfront_distribution_cdn_id" {
  value = aws_cloudfront_distribution.cdn.id
}

output  "cloudfront_distribution_cdn_hosted_zone_id" {
  value = aws_cloudfront_distribution.cdn.hosted_zone_id
}

output  "route53_record_domain_arn" {
  value = aws_route53_record.domain.arn
}

output  "route53_record_domain_zone_id" {
  value = aws_route53_record.domain.zone_id
}
