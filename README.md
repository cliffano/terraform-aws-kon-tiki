<img align="right" src="https://raw.github.com/cliffano/terraform-kon-tiki/main/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/terraform-kon-tiki/workflows/CI/badge.svg)](https://github.com/cliffano/terraform-kon-tiki/actions?query=workflow%3ACI)
<br/>

Terraform Kon-Tiki
------------------

Terraform Kon-Tiki is a Terraform module for provisioning infrastructure on AWS for hosting static websites with https support.

This module provisions the following AWS resources:

* Site S3 Bucket - for storing the [static website](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html) assets (e.g. HTML, JavaScript, CSS, image files, etc)
* CDN CloudFront - for caching the static assets, providing https endpoint, and [many other CDN capabilities](https://en.wikipedia.org/wiki/Amazon_CloudFront)
* Domain Route 53 - for provisioning the website's DNS record within a configured zone

It also provides the following optional AWS resources:

* Viewer Request Lambda - for processing request after it's received from viewer
* Origin Request Lambda - for processing request before it's forwarded to origin
* Extras S3 Bucket - for storing any additional asset that requires pre-processing before being stored in Site S3 Bucket

Architecture
------------

![Architecture Diagram](architecture.jpg)]

Installation
------------

Copy paste below code into your Terraform configuration, insert the variables, and run `terraform init`:

    module "kon_tiki" {
      source  = "cliffano/terraform-kon-tiki"
      version = "1.0.0"
    }

Usage
-----

    module "kon_tiki" {
      acm_certificate_arn          = "<acm_certificate_arn>"
      route53_domain               = var.route53_domain
      route53_zone_id              = "<route53_zone_id>"
      s3_bucket_cdn_log            = var.s3_bucket_cdn_log
      s3_bucket_site               = var.s3_bucket_site
      enable_s3_bucket_extras      = var.enable_s3_bucket_extras
      enable_lambda_viewer_request = true
      enable_lambda_origin_request = true
      lambda_origin_request_arn    = var.lambda_origin_request_arn
      region                       = "ap-southeast-2"
      tags = {
        tag1 = "value1"
        tag2 = "value2"
      }
    }

FAQ
---

*Q: Why doesn't this module provision an ACM certificate and a Route53 zone?*

A: Those two resources are purposely left out in order to allow the usage of pre-existing ACM certificate and Route53 zone. An ACM certificate could be provisioned in many ways, sometimes the certificate need to be produced by a non-AWS certificate authority, and sometimes users prefer different ways to validate ownership. As for Route53 zone, the static website usually tend to be one of the tenants of a zone, hence the zone ownership shouldn't live with this module.

*Q: Why doesn't the resulting website serve `index.html` by default?*

A: That is the default behaviour of S3 static website. If you would like to have `index.html` as the default page for every path, i.e. when a request is sent to `/hello` and you would like `/hello/index.html` to be served, then I recommend setting up Viewer Request Lambda using Lambda@Edge function from [standard-redirects-for-cloudfront](https://serverlessrepo.aws.amazon.com/applications/arn:aws:serverlessrepo:us-east-1:621073008195:applications~standard-redirects-for-cloudfront), and configure the function's ARN in `lambda_origin_request_arn` (don't forget to set `enable_lambda_origin_request` to `true`).

*Q: How to add HTTP basic authentication support?*

A: I recommend setting up Origin Request Lambda using Lambda@Edge function from [lambda-authorizer-basic-auth](https://serverlessrepo.aws.amazon.com/applications/arn:aws:serverlessrepo:us-east-1:560348900601:applications~lambda-authorizer-basic-auth), and configure the function's ARN in `lambda_viewer_request_arn` (don't forget to set `enable_lambda_viewer_request` to `true`).

# Terraform Doc
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.39.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.39.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.cdn](https://registry.terraform.io/providers/aws/4.39.0/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.cdn_oai](https://registry.terraform.io/providers/aws/4.39.0/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_route53_record.domain](https://registry.terraform.io/providers/aws/4.39.0/docs/resources/route53_record) | resource |
| [aws_s3_bucket.extras](https://registry.terraform.io/providers/aws/4.39.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.site](https://registry.terraform.io/providers/aws/4.39.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.extras_private](https://registry.terraform.io/providers/aws/4.39.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.site_private](https://registry.terraform.io/providers/aws/4.39.0/docs/resources/s3_bucket_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | ARN of SSL certificate in ACM | `string` | `null` | no |
| <a name="input_enable_lambda_origin_request"></a> [enable\_lambda\_origin\_request](#input\_enable\_lambda\_origin\_request) | Enable the provisioning of CloudFront Lambda Edge origin request | `bool` | `false` | no |
| <a name="input_enable_lambda_viewer_request"></a> [enable\_lambda\_viewer\_request](#input\_enable\_lambda\_viewer\_request) | Enable the provisioning of CloudFront Lambda Edge viewer request | `bool` | `false` | no |
| <a name="input_enable_s3_bucket_extras"></a> [enable\_s3\_bucket\_extras](#input\_enable\_s3\_bucket\_extras) | Enable the provisioning of S3 bucket for extra files | `bool` | `false` | no |
| <a name="input_lambda_origin_request_arn"></a> [lambda\_origin\_request\_arn](#input\_lambda\_origin\_request\_arn) | ARN of Lambda Function to be used as origin-request CloudFront Lambda@Edge | `string` | `"kon-tiki-lambda-origin-request-arn"` | no |
| <a name="input_lambda_viewer_request_arn"></a> [lambda\_viewer\_request\_arn](#input\_lambda\_viewer\_request\_arn) | ARN of Lambda Function to be used as viewer-request CloudFront Lambda@Edge | `string` | `"kon-tiki-lambda-viewer-request-arn"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html | `string` | `"ap-southeast-2"` | no |
| <a name="input_route53_domain"></a> [route53\_domain](#input\_route53\_domain) | Route53 record to be used as the domain name of the website | `string` | `null` | no |
| <a name="input_route53_zone_id"></a> [route53\_zone\_id](#input\_route53\_zone\_id) | Route53 hosted zone ID where the domain will be added to | `string` | `null` | no |
| <a name="input_s3_bucket_cdn_log"></a> [s3\_bucket\_cdn\_log](#input\_s3\_bucket\_cdn\_log) | Name of S3 bucket for storing CDN log | `string` | `null` | no |
| <a name="input_s3_bucket_extras"></a> [s3\_bucket\_extras](#input\_s3\_bucket\_extras) | Name of S3 bucket for storing extra files | `string` | `"kon-tiki-s3-bucket-extras"` | no |
| <a name="input_s3_bucket_site"></a> [s3\_bucket\_site](#input\_s3\_bucket\_site) | Name of S3 bucket for storing website content | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be added to all taggable AWS resources provisioned by Terraform Kon-Tiki | `map` | <pre>{<br>  "project": "kon-tiki"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_distribution_cdn_arn"></a> [cloudfront\_distribution\_cdn\_arn](#output\_cloudfront\_distribution\_cdn\_arn) | n/a |
| <a name="output_cloudfront_distribution_cdn_hosted_zone_id"></a> [cloudfront\_distribution\_cdn\_hosted\_zone\_id](#output\_cloudfront\_distribution\_cdn\_hosted\_zone\_id) | n/a |
| <a name="output_cloudfront_distribution_cdn_id"></a> [cloudfront\_distribution\_cdn\_id](#output\_cloudfront\_distribution\_cdn\_id) | n/a |
| <a name="output_route53_record_domain_fqdn"></a> [route53\_record\_domain\_fqdn](#output\_route53\_record\_domain\_fqdn) | n/a |
| <a name="output_route53_record_domain_name"></a> [route53\_record\_domain\_name](#output\_route53\_record\_domain\_name) | n/a |
| <a name="output_s3_bucket_site_arn"></a> [s3\_bucket\_site\_arn](#output\_s3\_bucket\_site\_arn) | n/a |
| <a name="output_s3_bucket_site_id"></a> [s3\_bucket\_site\_id](#output\_s3\_bucket\_site\_id) | n/a |
| <a name="output_s3_bucket_site_website_domain"></a> [s3\_bucket\_site\_website\_domain](#output\_s3\_bucket\_site\_website\_domain) | n/a |
