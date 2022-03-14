output "s3_bucket_site_arn" {
  value = aws_s3_bucket.site.arn
}

output "s3_bucket_site_id" {
  value = aws_s3_bucket.site.id
}

output "s3_bucket_site_website_domain" {
  value = aws_s3_bucket.site.website_domain
}