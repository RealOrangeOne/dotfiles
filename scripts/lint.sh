#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

set -x

yamllint -sc yamllint.yml yamllint.yml dotfiles.yml tasks/ vars.yml

ansible-lint dotfiles.yml -p -c .ansible-lint --exclude galaxy_roles/

ansible-playbook dotfiles.yml --syntax-check
