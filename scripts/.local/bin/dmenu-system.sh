#!/usr/bin/env bash

commands=(
	shutdown
	suspend
	reboot
	lock
	logout
	hibernate
)

# choice="$(printf '%s\n' "${commands[@]}" | dmenu -p "System:" )"
choice="$(printf '%s\n' "${commands[@]}" | rofi -dmenu )"

case "$choice" in
    shutdown)
       systemctl poweroff ;;
    suspend)
      systemctl suspend ;;
    reboot)
      systemctl reboot ;;
    lock)
      lock ;;
    logout)
      i3-msg exit ;;
    hibernate)
      systemctl hibernate ;;
    *)
      exit 2
esac

exit 0
