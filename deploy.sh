#!/usr/bin/env bash

set -e

puppet apply manifests/main.pp --modulepath=modules/ --verbose
