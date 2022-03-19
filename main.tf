provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "site" {
    bucket = var.s3_bucket_site
    acl = "private"
    policy = <<EOF
{
  "Id": "bucket_policy_site",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "bucket_policy_site_main",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Principal": {
          "AWS": "${aws_cloudfront_origin_access_identity.cdn_oai.iam_arn}"
      },
      "Resource": "arn:aws:s3:::${var.s3_bucket_site}/*"
    }
  ]
}
EOF
    website {
        index_document = "index.html"
        error_document = "404.html"
    }
    tags = {
        project = "kon-tiki"
    }
    force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "site_private" {

    bucket = aws_s3_bucket.site.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket" "gallery" {
    count  = var.enable_s3_bucket_gallery ? 1 : 0
    bucket = var.s3_bucket_gallery
    acl    = "private"
    tags = {
        project = "kon-tiki"
    }
    force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "gallery_private" {

    bucket = aws_s3_bucket.gallery[0].id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "aws_cloudfront_origin_access_identity" "cdn_oai" {
  comment = "Origin access identity for destination S3-${var.s3_bucket_site}"
}

resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = aws_s3_bucket.site.bucket_regional_domain_name
    origin_id   = "S3-${var.s3_bucket_site}"
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.cdn_oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CDN distribution for ${var.s3_bucket_site}"
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = var.s3_bucket_cdn_log
    prefix          = var.s3_bucket_site
  }

  aliases = [var.route53_domain_name]

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    target_origin_id       = "S3-${var.s3_bucket_site}"
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }
    lambda_function_association {
      event_type   = "origin-request"
      lambda_arn   = var.enable_lambda_origin_request ? var.lambda_origin_request_arn : null
      include_body = false
    }
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
      project = "kon-tiki"
  }

  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
  }
}

resource "aws_route53_record" "domain" {
   name = var.route53_domain_name
   zone_id = "${var.route53_domain_zoneid}"
   type = "A"
   alias {
     name = aws_cloudfront_distribution.cdn.domain_name
     zone_id = aws_cloudfront_distribution.cdn.hosted_zone_id
     evaluate_target_health = true
   }
}