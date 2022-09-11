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

output  "route53_record_domain_name" {
  value = aws_route53_record.domain.name
}

output  "route53_record_domain_fqdn" {
  value = aws_route53_record.domain.fqdn
}
