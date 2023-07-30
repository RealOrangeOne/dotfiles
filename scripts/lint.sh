#!/usr/bin/env bash

set -e

PATH=${PWD}/env/bin:${PATH}

set -x

yamllint -s .

ansible-lint -p

ansible-playbook dotfiles.yml --syntax-check
