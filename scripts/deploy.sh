#!/usr/bin/env bash

set -ex

time sudo ansible-playbook dotfiles.yml $@
