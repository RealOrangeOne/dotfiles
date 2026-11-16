#!/usr/bin/env bash

set -ex

# Use `su` as my user may not have `sudo`
time su -c "ansible-playbook dotfiles.yml $@"
