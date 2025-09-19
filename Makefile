# comment
.PHONEY: build-r build-python clean build
SHELL := /bin/bash

# Build arguments
R_VERSION := 4.3.3
PYTHON_VERSION := 3.12.2-slim-bookworm


# Allow date to be set from command line, default to today's date
date ?= $(shell date +'%Y-%m-%d')


# Environment variables
PUID = $$(whoami | id -u)
PGID = $$(whoami | id -g)
PORT = 8443


build-r:
	docker build . \
		--file Dockerfile-r-tidyverse \
		--tag csprock/dockerfiles:r-tidyverse-${R_VERSION} \
		--tag csprock/dockerfiles:r-tidyverse-${R_VERSION}-${date} \
		--tag csprock/dockerfiles:r-tidyverse-${R_VERSION}-latest \
		--tag csprock/dockerfiles:r-tidyverse-latest \
		--build-arg R_VERSION=${R_VERSION}


build:
	docker build . \
		--file Dockerfile-$(lang)-$(name) \
		--tag csprock/dockerfiles:$(lang)-$(name)-$(date) \
		--tag csprock/dockerfiles:$(lang)-$(name)-latest \
		--build-arg PYTHON_VERSION=${PYTHON_VERSION} \
		--build-arg VERSION=$(version) \
		--build-arg R_VERSION=${R_VERSION}


build-lambda:
	docker build . \
		--file Dockerfile-lambda \
		--tag csprock/dockerfiles:lambda-latest \
		--tag csprock/dockerfiles:lambda-$(date) \
		--build-arg PYTHON_VERSION=${PYTHON_VERSION}

push-lambda:
	docker push csprock/dockerfiles:lambda-latest
	docker push csprock/dockerfiles:lambda-$(date)


clean:
	docker image rm csprock/dockerfiles:$(lang)-$(name)-$(date)
	docker image rm csprock/dockerfiles:$(lang)-$(name)-latest


push:
	docker push csprock/dockerfiles:$(lang)-$(name)-$(date)


push-latest:
	docker push csprock/dockerfiles:$(lang)-$(name)-latest
