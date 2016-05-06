#!/usr/bin/env bash

set -e

ln -sfP ~/.dotfiles/bash/.bashrc ~/.bashrc
source ~/.bashrc

# Arch uses python3 by default. Let's fix that...
sudo rm -rf /usr/bin/python
sudo ln -sfP /usr/bin/python2 /usr/bin/python

# Arch has the nvm script in a weird place. Time to fix!
sudo ln -sfP /usr/share/nvm/init-nvm.sh ~/.nvm/nvm.sh
