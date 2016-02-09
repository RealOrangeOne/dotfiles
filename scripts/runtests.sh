#!/usr/bin/env bash

set -e

echo ">> Validating JSON..."
npm install jsonlint -g
jsonlint -q apt/apt-installs-core.json
jsonlint -q apt/apt-installs-extra.json
jsonlint -q apt/apt-keys.json
jsonlint -q apt/apt-repos.json
jsonlint -q atom/packages.json


echo ">> Validating Python..."
pip install flake8

flake8 * --ignore=E128,E501 --exclude=env/,node_modules/
