# comment
.PHONEY: build-r build-python clean build
SHELL := /bin/bash

# Build arguments
R_VERSION := 4.1.2
PYTHON_VERSION := 3.10.7-slim-bullseye

# Environment variables
PUID = $$(whoami | id -u)
PGID = $$(whoami | id -g)
PORT = 8443
TZ = America/Los_Angeles


build-r:
	docker build . \
		--file Dockerfile-r \
		--tag csprock/r-base:${R_VERSION} \
		--build-arg R_VERSION=${R_VERSION}


build:
	docker build . \
		--file Dockerfile-$(lang)-$(name) \
		--tag csprock/$(lang)-$(name):$(version) \
		--build-arg PYTHON_VERSION=${PYTHON_VERSION} \
		--build-arg VERSION=$(version)


clean:
	docker image rm csprock/$(lang)-$(name):$(version)
