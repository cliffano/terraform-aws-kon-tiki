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

Configuration
-------------

Usage
-----

FAQ
---