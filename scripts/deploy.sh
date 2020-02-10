#!/usr/bin/env bash

set -ex

sudo env/bin/ansible-playbook -i hosts dotfiles.yml
