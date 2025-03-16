# comment
.PHONEY: build-r build-python clean build
SHELL := /bin/bash

# Build arguments
R_VERSION := 4.1.2
PYTHON_VERSION := 3.12.2-slim-bookworm

# today's date
DATE := $(shell date +'%Y-%m-%d')

# Environment variables
PUID = $$(whoami | id -u)
PGID = $$(whoami | id -g)
PORT = 8443


build-r:
	docker build . \
		--file Dockerfile-r \
		--tag csprock/dockerfiles/r-base-${R_VERSION} \
		--tag csprock/dockerfiles/r-base-${R_VERSION}-${DATE} \
		--tag csprock/dockerfiles/r-base-${R_VERSION}-latest \
		--build-arg R_VERSION=${R_VERSION}


build:
	docker build . \
		--file Dockerfile-$(lang)-$(name) \
		--tag csprock/dockerfiles:$(lang)-$(name)-$(DATE) \
		--tag csprock/dockerfiles:$(lang)-$(name)-latest \
		--build-arg PYTHON_VERSION=${PYTHON_VERSION} \
		--build-arg VERSION=$(version) \
		--build-arg R_VERSION=${R_VERSION}


clean:
	docker image rm csprock/dockerfiles:$(lang)-$(name)-$(DATE)
	docker image rm csprock/dockerfiles:$(lang)-$(name)-latest


push:
	docker push csprock/dockerfiles:$(lang)-$(name)-$(DATE)

push-latest:
	docker push csprock/dockerfiles:$(lang)-$(name)-latest
