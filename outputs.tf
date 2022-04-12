output  "cloudfront_distribution_cdn_id" {
  value = aws_cloudfront_distribution.cdn.id
}

output  "cloudfront_distribution_cdn_hosted_zone_id" {
  value = aws_cloudfront_distribution.cdn.hosted_zone_id
}

output "s3_bucket_site_arn" {
  value = aws_s3_bucket.site.arn
}

output "s3_bucket_site_id" {
  value = aws_s3_bucket.site.id
}

output "s3_bucket_site_website_domain" {
  value = aws_s3_bucket.site.website_domain
}