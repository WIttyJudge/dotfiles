#!/usr/bin/env bash

if [ "$(whoami)" != "root" ]; then
	echo "You have to run this script as the root user"
	exit 1
fi

List=( 
	git
	neofetch
	profile
	terminator
	zsh 
);

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
