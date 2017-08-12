#!/usr/bin/env bash

sudo puppet apply manifests/main.pp --modulepath=modules/
