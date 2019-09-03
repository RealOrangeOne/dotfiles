#!/usr/bin/env bash

# From: https://github.com/jaagr/polybar/issues/763#issuecomment-392960721

pkill polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar top &
  MONITOR=$m polybar bottom &
done
