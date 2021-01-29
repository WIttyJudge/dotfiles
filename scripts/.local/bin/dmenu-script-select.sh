#!/bin/sh

commands=(
  '< Exit'
  '---'
  '1 [ System ]'
  '2 [ Reloader ]'
  '---'
  '3 [ rofi-pass ]'
  '---'
  'dotfiles'
)

scripts_folder="$HOME/.local/bin/dmenu"

choice="$(printf '%b\n' "${commands[@]}" | rofi -dmenu -i bmenu -p "Select command > ")"

case "$choice" in
  "1 [ System ]")
    sh "$scripts_folder/dmenu-system.sh" ;;
  "2 [ Reloader ]")
    sh "$scripts_folder/dmenu-reloader.sh" ;;
  "3 [ rofi-pass ]")
    rofi-pass ;;
  "dotfiles")
    $TERMINAL -e sh -c 'cd ~/dotfiles && nvim' ;;
  '< Exit') exit ;;
  *) exit ;;
esac
