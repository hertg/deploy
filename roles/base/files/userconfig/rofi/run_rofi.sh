#!/usr/bin/env bash
options="one
two
three"
theme=${1:-$HOME/.config/rofi/config.rasi}
rofi -show drun -normal-window -config $theme
#selection=$(echo -e "${options}" | rofi -dmenu -normal-window -config $theme)
case "${selection}" in
  "one")
    notify-send "run_rofi.sh" "one";;
  "two")
    notify-send "run_rofi.sh" "two";;
  "three")
    notify-send "run_rofi.sh" "three";;
esac
