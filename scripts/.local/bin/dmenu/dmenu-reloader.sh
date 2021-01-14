#!/bin/sh

files=(
  i3wm
  .Xresources
  .zshrc
)

choice="$(printf '%s\n' "${files[@]}" | rofi -dmenu -i bmenu -p "What to reload > ")"

notifier() {
  notify-send "$1 successfully reloaded."
}

case "$choice" in
  i3wm)
    i3-msg restart && notifier "i3wm" ;;
  .Xresources)
    xrdb ~/.Xresources && notifier ".Xresources" ;;
  .zshrc)
    source ~/.zshrc && notifier ".zshrc" ;;
  *) exit ;;
esac
