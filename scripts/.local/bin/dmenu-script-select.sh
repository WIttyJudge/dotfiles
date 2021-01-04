#!/bin/sh

scripts_folder="$HOME/.local/bin/dmenu"

choice=$(ls $scripts_folder | rofi -dmenu bmenu -p 'select script')

[ -f "$scripts_folder/$choice" ] && $(sh $scripts_folder/$choice) || exit

