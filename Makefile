.DEFAULT_GOAL := help
.PHONY: help

OS = $(shell uname)

# COLORS
RED    = $(shell printf "\33[31m")
GREEN  = $(shell printf "\33[32m")
WHITE  = $(shell printf "\33[37m")
YELLOW = $(shell printf "\33[33m")
RESET = $(shell printf "\33[0m")

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#
#  HELP
#
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

help: ## Shows what you are seeing now
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#
#  DEVELOPMENT
#
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

development_setup: ## Installs development dependencies
	@echo "${YELLO}Setup development environment...${RESET}"
	@pip install -r requirements/dev.txt
	@echo "${GREEN}✔ setup finished successfully${RESET}\n"

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#
#  TEST
#
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

test: ## Runs unit tests
	@echo "${YELLOW}Running all tests${RESET}\n"
	@coverage run --source typetalk -m py.test --pep8
	@coverage report
	@echo "${GREEN}✔ well done!${RESET}\n"

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#
#  PUBLISH
#
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

build_prepare: ## Installs dependencies for publish package
	@echo "${YELLOW}Preparing for build...${RESET}"
	@pip install -r requirements/prod.txt
	@python -m pip install --user --upgrade setuptools wheel twine
	@echo "${GREEN}✔ setup finished successfully${RESET}\n"

build: ## Build package
	@echo "${YELLOW}Building...${RESET}"
	@python setup.py sdist bdist_wheel
	@echo "${GREEN}✔ successfully built${RESET}\n"

publish: ## Publish package
	@echo "${YELLOW}Uploading...${RESET}"
	@twine upload dist/*
	@echo "${GREEN}✔ successfully published${RESET}\n"
