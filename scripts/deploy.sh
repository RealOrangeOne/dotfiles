#!/usr/bin/env bash

set -ex

time ansible-playbook dotfiles.yml -K $@
