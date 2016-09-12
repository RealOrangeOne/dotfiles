#!/usr/bin/env bash

echo "> Deploying to GitHub..."

set -e

echo ">> Removing any existing..."
rm -rf /tmp/existing-dotfiles || "No Existing Found"

echo ">> Downloading existing dotfiles..."
git clone --depth=1 git@github.com:RealOrangeOne/dotfiles.git /tmp/existing-dotfiles

echo ">> Remove existing files..."
cd /tmp/existing-dotfiles
git rm -rf .
cd -

echo ">> Copying existing..."
rsync -rtv . /tmp/existing-dotfiles/

echo ">> Getting Atom Data..."
cd /tmp/existing-dotfiles/
mkdir -p atom
git clone --depth=1 git@gist.github.com:9f9a4dd799ad01aa0502a09f06cbf454.git atom/
rm -rf atom/.git
mv atom/Atom\ Settings.md atom/README.md

echo ">> Preparing Git..."
git config user.name "Jake Howard"
git config user.email "git@theorangeone.net"
git add .
git reset HEAD .
echo ">> Ready!"
echo "1. Add and commit files."
echo "2. git push -f origin master"
echo "3. rm -rf $PWD"
