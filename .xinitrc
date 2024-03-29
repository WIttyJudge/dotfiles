#!/bin/sh

# xinitrc runs automatically when you run startx, xinit or any other DM which uses ~/.xinitrc or ~/.xsession.

# .xprofile contains some important programs that need to be run before we start graphical environment.
[ -f "$HOME/.xprofile" ] && source "$HOME/.xprofile"

# exec i3
# ssh-agent dwm
exec bspwm
