#!/usr/bin/env bash

set -e

echo ">> Setting up tests"
npm install jsonlint -g
pip install flake8


echo ">> Validating JSON..."
jsonlint -q apt/apt-installs-core.json
jsonlint -q apt/apt-installs-extra.json
jsonlint -q apt/apt-keys.json
jsonlint -q apt/apt-repos.json
jsonlint -q atom/packages.json
jsonlint -q yaourt/packages.json


echo ">> Validating Python..."
flake8 apt/exports.py --ignore=E128,E501,E401,F403
flake8 scripts/installers.py --ignore=E128,E501,E401,F403
flake8 yaourt/exports.py --ignore=E128,E501,E401,F403
flake8 INSTALL_ALL_THE_THINGS --ignore=E128,E501,E401,F403
