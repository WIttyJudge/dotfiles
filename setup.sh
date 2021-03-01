#!/usr/bin/env dash

### OPTIONS AND VARIABLES ###

GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

# List of directory names with dotfiles we need to setup
folders=(
  bash
  dunst
  flameshot
  git
  # i3
  mpv
  neofetch
  # polybar
  neovim
  rofi
  scripts
  profile
  sxhkd
  sxiv
  # terminator
)

### FUNCTIONS ###

# GNU Stow is a symlink farm manager. https://www.gnu.org/software/stow
stowit() {
	name=$1

  printf "\nSetup for: ${GREEN}%s${NORMAL}\n" "$name"

	# -v - see what is going on.
	# -R - purge old links.
	# -t - target.
	stow --adopt -v -R -t ~ $name
}


### SCRIPT EXECUTION ###

# Output brief information before running the script
echo "///////////////////////////////////////////////////////////////////////"
echo -e "///////////////////// ${GREEN}Created by Witty Judge${NORMAL} //////////////////////////"
echo -e "//////////// https://github.com/WIttyJudge/dotfiles ///////////////"
echo "///////////////////// Dotfile Setup /////////////////////////"
echo "///////////////////////////////////////////////////////////////////////"
read -n 1 -r -s -p $'//////////////////// Press any key to continue ////////////////////////\n\n'

for i in ${folders[@]}; do
	stowit $i
done
