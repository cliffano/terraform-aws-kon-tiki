ci: clean init lint

clean:
	rm -rf .terraform

init:
	terraform init

lint: init
	terraform validate

.PHONY: clean init lint