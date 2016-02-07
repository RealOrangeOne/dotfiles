#!/usr/bin/env bash

set -e


echo ">> Collecting Packages..."
wget https://atom.io/download/deb -O atom.deb
wget "https://www.astrill.com/downloads/astrill-setup-linux64.deb?mirror=uk" -O astrill.deb
curl -sL https://deb.nodesource.com/setup_5.x | -E bash -

echo ">> Installing Packages..."
dpkg -i atom.deb
dpkg -i astrill.deb


echo ">> Installing Apt Packages"
apt-get install nodejs -y


echo ">> Installing other packages..."
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
wget -O - https://raw.githubusercontent.com/nvbn/thefuck/master/install.sh | sh - && $0


echo ">> Cleaning up..."
rm -rf atom.deb astrill.deb
