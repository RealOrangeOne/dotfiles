#!/usr/bin/env bash

set -e

echo ">> Validating JSON..."
npm install jsonlint
jsonlint -q apt/apt-installs-core.json
jsonlint -q apt/apt-installs-extra.json
jsonlint -q apt/apt-keys.json
jsonlint -q apt/apt-repos.json
jsonlint -q atom/packages.json


echo ">> Validating Python..."
pip install flake8

flake8 scripts/install_dotfiles.py --ignore=E128,E501,E401,F403
flake8 INSTALL_ALL_THE_THINGS --ignore=E128,E501,E401,F403
