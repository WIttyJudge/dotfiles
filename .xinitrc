#!/bin/sh

# xinitrc runs automatically when you run startx, xinit or any other DM which uses ~/.xinitrc or ~/.xsession.

# .xprofile contains some important programs that need to be run before we start graphical environment.
[ -f ~/.xprofile ] && source ~/.xprofile

if ! pacman -Qs libxft-bgra >/dev/null 2>&1; then
	echo "\033[31mIMPORTANT\033[0m: Note that \033[32m\`libxft-bgra\`\033[0m must be installed for this build of dwm.
Please run:
	\033[32mparu -S libxft-bgra-git\033[0m
and replace \`libxft\`. Afterwards, you may start the graphical server by running \`startx\`." &&
  exit 1
fi

# exec i3
ssh-agent dwm
