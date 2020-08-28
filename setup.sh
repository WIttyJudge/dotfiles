#!/usr/bin/env bash

# Am I root?
[ "$EUID" -ne 0 ] && echo "You have to run this script as the root user" && exit 1

# Output brief information before running the script
echo "/////////////////////////////////////////////////////////////////////////////"
echo "//////////////////////// Created by Witty Judge /////////////////////////////"
echo "/////////////// https://github.com/WIttyJudge/setup-linux ///////////////////"
echo "//////////////////////// Setup linux for ${type} ////////////////////////////"
echo "/////////////////////////////////////////////////////////////////////////////"
read -n 1 -r -s -p $'/////////////////////// Press any key to continue ///////////////////////////\n\n'

# List of directory names with dotfiles we need to setup
List=(
	bash
	git
	neofetch
	profile
	terminator
	zsh 
);

# GNU Stow is a symlink farm manager. https://www.gnu.org/software/stow
stowit() {
	folder=$1

	# -v - see what is going on.
	# -R - purge old links.
	# -t - target.
	stow -v -R -t ~ ${folder}
}

for i in ${List[@]}; do
	stowit ${i}
done
