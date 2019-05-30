DOCKER_VOLUME := $(shell pwd)
SHELLCHECK_IMG = koalaman/shellcheck

check: deps lint

lint: create-model
	docker run --rm -t -v $(DOCKER_VOLUME):/mnt $(SHELLCHECK_IMG) $<

deps:
	docker pull $(SHELLCHECK_IMG)
