#!/usr/bin/env bash

set -e

echo ">> Validating JSON..."
npm install jsonlint -g
jsonlint -q *.json


echo ">> Validating Python..."
pip install flake8

flake8 * --ignore=E128,E501
