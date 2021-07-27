#!/bin/sh

# xinitrc runs automatically when you run startx, xinit or any other DM which uses ~/.xinitrc or ~/.xsession.

# .xprofile contains some important programs that need to be run before we start graphical environment.
[ -f ~/.xprofile ] && source ~/.xprofile

# Run i3 DM.
# exec i3
ssh-agent dwm
