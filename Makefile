SHELL=/bin/bash

ifndef CHANGES
	CHANGES=$(shell git log -1 --pretty=%B | head -1 | head -c 255)
endif

TEMPLATE=./packer.json
BRANCH=$(shell git rev-parse --abrev-ref HEAD)

build:
	set -o pipefail; CHANGES="$(CHANGES)" BRANCH="$(BRANCH)" GITINFO="$(BRANCH)@$(shell git log -1 --pretty=%H)" packer build $(TEMPLATE)
