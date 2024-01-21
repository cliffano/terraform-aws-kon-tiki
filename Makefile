# TODO: remove temporary version variable when RTK is upgraded to a version that supports HCL2 resource type
version ?= 0.9.0

ci: clean stage deps init lint doc

clean:
	rm -rf .terraform

stage:
	mkdir -p stage/

deps: stage
	curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
	curl -sSLo stage/terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-`uname`-amd64.tar.gz
	cd stage/ && tar -xzf terraform-docs.tar.gz && chmod +x terraform-docs

init:
	rm -f .terraform.lock.hcl
	terraform init

lint: init
	terraform validate
	tflint --chdir=.

doc:
	sed -zi 's/# Terraform Doc.*/# Terraform Doc/' README.md
	stage/terraform-docs markdown . > stage/terraform-docs-output.md
	sed -i '/# Terraform Doc/r stage/terraform-docs-output.md' README.md

.PHONY: clean stage deps init lint doc