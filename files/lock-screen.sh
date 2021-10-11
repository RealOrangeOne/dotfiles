#!/usr/bin/env bash

set -e

BG_DIR="$HOME/Upload/bg/"
BG=$(ls "$BG_DIR" | sort -R | tail -n 1)

i3lock -i "$BG_DIR/$BG" --scale --clock --indicator --inside-color=00000088 --indicator --date-color=FFFFFF --time-color=FFFFFF
