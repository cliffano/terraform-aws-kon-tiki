<img align="right" src="https://raw.github.com/cliffano/terraform-kon-tiki/main/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/terraform-kon-tiki/workflows/CI/badge.svg)](https://github.com/cliffano/terraform-kon-tiki/actions?query=workflow%3ACI)
<br/>

Terraform Kon-Tiki
------------------

Terraform Kon-Tiki is a Terraform module for provisioning infrastructure for hosting static web sites on AWS with https support.

This module provisions the following AWS resources:

* Site S3 Bucket - for storing the [static website](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html) assets (e.g. HTML, JavaScript, CSS, image files, etc)
* CDN CloudFront - for caching 
* Domain Route 53 - 

It also provides the following optional AWS resources:

* Viewer Request Lambda - 
* Origin Request Lambda - 
* Extras S3 Bucket - for storing any additional 

Architecture
------------

![Architecture Diagram](architecture.jpg)]

Installation
------------

Usage
-----

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
| <a name="input_route53_domain"></a> [route53\_domain](#input\_route53\_domain) | Route53 record to be used as the domain name of the web site | `string` | `null` | no |
| <a name="input_route53_zone_id"></a> [route53\_zone\_id](#input\_route53\_zone\_id) | Route53 hosted zone ID where the domain will be added to | `string` | `null` | no |
| <a name="input_s3_bucket_cdn_log"></a> [s3\_bucket\_cdn\_log](#input\_s3\_bucket\_cdn\_log) | Name of S3 bucket for storing CDN log | `string` | `null` | no |
| <a name="input_s3_bucket_extras"></a> [s3\_bucket\_extras](#input\_s3\_bucket\_extras) | Name of S3 bucket for storing extra files | `string` | `"kon-tiki-s3-bucket-extras"` | no |
| <a name="input_s3_bucket_site"></a> [s3\_bucket\_site](#input\_s3\_bucket\_site) | Name of S3 bucket for storing web site content | `string` | `null` | no |
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
