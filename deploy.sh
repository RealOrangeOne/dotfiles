#!/usr/bin/env bash

set -e

puppet apply manifests/main.pp --modulepath=modules/ --verbose

patch /usr/bin/makepkg < makepkg.patch
puppet apply manifests/packages.pp --modulepath=modules/ --verbose
patch /usr/bin/makepkg -R < makepkg.patch
