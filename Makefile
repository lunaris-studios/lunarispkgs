# MAKEFILE
#
# @author      Sam Craig <sam@toybox.ooo>
# @link        https://github.com/talismanco/talismanpkgs
# ------------------------------------------------------------------------------

.EXPORT_ALL_VARIABLES:

# Display general help about this command
.PHONY: help
help:
	@echo ""
	@echo "$(PROJECT) Makefile."
	@echo ""
	@echo "The following commands are available:"
	@echo ""
	@echo "    make create-package        : Scaffold package directory"
	@echo ""
	@echo "    make update                : Update project dependencies"
	@echo "    make update-nix            : Update niv sources"
	@echo "    make update-npm            : Update npm dependencies"
	@echo ""

# === Entities ===

# URL of the remote repository
REPOSITORY := $$PROJECT_REPOSITORY

# Project owner
OWNER := $$PROJECT_OWNER

# Project name
PROJECT := $$PROJECT_NAME

# Project version
VERSION := $$PROJECT_VERSION

# Project commit hash
COMMIT := $(shell git rev-parse HEAD)

# Project vendor
VENDOR := $(NAME)-vendor

# Name of RPM or DEB package
PKGNAME := $(VENDOR)-$(NAME)

# === Shell Configuration ===

SHELL := /bin/bash

UNAME_OS := $(shell uname -s | tr '[:upper:]' '[:lower:]')
UNAME_ARCH := $(shell uname -m | tr '[:upper:]' '[:lower:]')

# === Environment ===

STAGE ?= development

ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
CONFIG_DIR := $(ROOT_DIR)/config
SETTINGS_DIR := $(CONFIG_DIR)/settings
TARGET_DIR := $(ROOT_DIR)/target

# Combine the active project stage configuration settings
# with the included `global.json` configuartion settings.
STAGE_SETTINGS := $(SETTINGS_DIR)/$(STAGE).json
GLOBAL_SETTINGS := $(SETTINGS_DIR)/global.json

export PATH := $(PATH):$(TARGET_DIR)

.PHONY: .env.json
.env.json:
	@jq -s '.[0] * .[1]' $(STAGE_SETTINGS) $(GLOBAL_SETTINGS) > .env.json

# Export `.tool-versions` entries as environment variables
# with the pattern "<DEPENDENCY_NAME>_VERSION=<DEPENDENCY_VERSION>"
# to the temp file `.tool-versiions.env`
include .tool-versions.env
.PHONY: .tool-versions.env
.tool-versions.env: .tool-versions
	@(sed -e 's/\(.*\)\ \(.*\)/\1_VERSION=\2/g' | tr '[:lower:]' '[:upper:]') < $< > $@

include .env
.PHONY: .env
.env: .env.json
	@(python ./scripts/python/jsontoenv.py) < $< > $@

.PHONY: .env.yaml
.env.yaml: .env.json
	@(python ./scripts/python/jsontoyaml.py) < $< > $@

# === Commands ===

# === create-package ===

# Scaffold package directory
.PHONY: create-package
create-package:
	@mkdir -p $(ROOT_DIR)/pkgs/$(name)
	@mkdir -p $(ROOT_DIR)/pkgs/$(name)/versions
 
	@touch $(ROOT_DIR)/pkgs/$(name)/default.nix
	@touch $(ROOT_DIR)/pkgs/$(name)/versions/0.0.0.nix

# === update ===

# Update all project dependencies
.PHONY: update
update:
	@$(MAKE) -s update-niv
	@$(MAKE) -s update-npm

# === update-niv ===

# Update niv dependencies
.PHONY: update-niv
update-niv:
	@niv update

# === update-npm ===

# Update npm packages
.PHONY: update-npm
update-npm:
	@npm run update
