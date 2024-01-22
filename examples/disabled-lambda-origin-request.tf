module "kon_tiki" {
  region                       = "ap-southeast-2"
  acm_certificate_arn          = "arn:aws:acm:us-east-1:123456789012:certificate/21f01ef7-f64d-427a-9b5c-55178a46d6a0"
  route53_domain               = "somesite.somedomain.com"
  route53_zone_id              = "Z09836883JG7GHJIUIPJA"
  s3_bucket_cdn_log            = "somecdnlog"
  s3_bucket_site               = "somesite.somedomain.com"
  enable_s3_bucket_extras      = true
  s3_bucket_extras             = "someextras.somedomain.com"
  enable_lambda_viewer_request = true
  lambda_viewer_request_arn    = "arn:aws:lambda:us-east-1:123456789012:function:serverlessrepo-wehr-enter-LambdaAuthorizerBasicAut-wnvuW5BxvLWY:1"
  enable_lambda_origin_request = false
  tags = {
    tag1 = "value1"
    tag2 = "value2"
  }
}
