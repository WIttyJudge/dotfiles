#!/bin/sh

commands=(
  '< Exit'
  '---'
  '1 [ Reloader ]'
  '2 [ System ]'
  '---'
  '3 [ rofi-pass ]'
  
  'dotfiles'
)

scripts_folder="$HOME/.local/bin/dmenu"

choice="$(printf '%b\n' "${commands[@]}" | rofi -dmenu -i bmenu -p "What to reload > ")"

case "$choice" in
  "1 [ Reloader ]")
    sh "$scripts_folder/dmenu-reloader.sh" ;;
  "2 [ System ]")
    sh "$scripts_folder/dmenu-system.sh" ;;
  "3 [ rofi-pass ]")
    rofi-pass ;;
  "dotfiles")
    $TERMINAL -e sh -c 'cd ~/dotfiles && nvim' ;;
  '< Exit') exit ;;
  *) exit ;;
esac
