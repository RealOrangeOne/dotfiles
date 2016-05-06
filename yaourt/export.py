#!/usr/bin/env python3
import os, json

# Update pre-installed packages and repo lists
os.system('sudo yaourt -Syau')

# Install extra packages
packages = " ".join(json.load(open('packages.json')))
os.system("sudo yaourt -S {} ".format(packages))

# Symlink yaourtrc file
os.system('ln -s ~/.dotfiles/yaourt/.yaourtrc ~/.yaourtrc')
