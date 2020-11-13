# MAKEFILE
#
# @author      Sam Craig <sam@toybox.ooo>
# @link        https://github.com/toyboxco/toyboxpkgs
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
	@echo "    make create-package : Scaffold package directory"
	@echo ""

# === Entities ===

# URL of the remote repository
REPOSITORY := https://github.com/toyboxco/toyboxpkgs

# Project owner
OWNER := toyboxco

# Project name
PROJECT := toyboxpkgs

# Project version
VERSION := 0.0.0

# === Shell Configuration ===

SHELL := /bin/bash

UNAME_OS := $(shell uname -s | tr '[:upper:]' '[:lower:]')
UNAME_ARCH := $(shell uname -m | tr '[:upper:]' '[:lower:]')

TMP_BASE := vendor
TMP := $(TMP_BASE)
TMP_BIN = $(TMP)/bin
TMP_VERSIONS := $(TMP)/versions

# === Environment ===

ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

# === Create Package ===

# Scaffold package directory
.PHONY: create-package
create-package:
	@mkdir -p $(ROOT_DIR)/pkgs/$(name)
	@mkdir -p $(ROOT_DIR)/pkgs/$(name)/versions
 
	@touch $(ROOT_DIR)/pkgs/$(name)/default.nix
	@touch $(ROOT_DIR)/pkgs/$(name)/versions/0.0.0.nix
