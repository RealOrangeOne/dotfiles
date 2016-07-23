#!/usr/bin/env bash

set -e

echo "Removing volume change sound..."
gsettings set org.gnome.desktop.sound event-sounds false

echo "Decreasing volume increment..."
gsettings set org.gnome.settings-daemon.plugins.sound volume-step 1
