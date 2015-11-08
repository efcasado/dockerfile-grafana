###========================================================================
### File: Makefile
###
### Author(s): Enrique Fernandez <efcasado@gmail.com>
###========================================================================

##=========================================================================
## Settings
##=========================================================================

# Other valid values are: snapshot and release
ENV         ?= dev

DOCKER_OPTS := -d -p 3000:3000 -v "$(PWD)/var/lib/grafana/dashboards/:/var/lib/grafana/dashboards/"

##=========================================================================
## Variables
##=========================================================================

PROJECT     := grafana

GIT_TAG     := $(shell git describe --tags 2> /dev/null)
GIT_BRANCH  := $(shell git rev-parse --abbrev-ref HEAD 2> /dev/null)
GIT_COMMIT  := $(shell git rev-parse --short HEAD 2> /dev/null)

ifeq ($(ENV),snapshot)
VERSION     := $(GIT_BRANCH)-git$(GIT_COMMIT)
else ifeq ($(ENV),release)
VERSION     := $(GIT_TAG)
endif

ifeq ($(ENV),dev)
TAG         := $(PROJECT)
else
TAG         := $(PROJECT):$(VERSION)
endif

DOCKER      := $(shell which docker)


##=========================================================================
## Targets
##=========================================================================

all: | build

build:
	$(DOCKER) build -t $(TAG) .

start: | build
	$(DOCKER) run --name $(PROJECT) $(DOCKER_OPTS) $(TAG)

stop:
	$(DOCKER) stop $(PROJECT)
	$(DOCKER) rm $(PROJECT)
