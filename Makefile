ci: clean deps init lint

clean:
	rm -rf .terraform

deps:
	curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

init:
	rm -f .terraform.lock.hcl
	terraform init

lint: init
	terraform validate
	tflint .

.PHONY: clean deps init lint