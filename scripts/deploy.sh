#!/usr/bin/env bash

set -ex

sudo env/bin/ansible-playbook dotfiles.yml
