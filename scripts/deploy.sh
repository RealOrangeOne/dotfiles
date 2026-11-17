#!/usr/bin/env bash

set -ex

export USER=root
export LOGNAME=root

# Use `su` as my user may not have `sudo`
time su -c "ansible-playbook dotfiles.yml $@"
