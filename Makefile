TOPDIR := $(strip $(dir $(realpath $(lastword $(MAKEFILE_LIST)))))

ifneq (,$(wildcard $(TOPDIR)/.env))
  include $(TOPDIR)/.env
  export
endif

comma:= ,
empty:=
space:= $(empty) $(empty)

bold := $(shell tput bold)
green := $(shell tput setaf 2)
sgr0 := $(shell tput sgr0)

SCRIPTS := $(shell find -s * -type f -name "link.sh" -prune -print)

all: help

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

links: ## Run link.sh recursively
	@for script in $(SCRIPTS); do \
		printf "Running $(bold)$$script$(sgr0) ... " ; \
		sh "$$script" || exit 1; \
		printf "$(green)done$(sgr0)\n"; \
	done

.PHONY: help links
