#!/usr/bin/env dash

# Output brief information before running the script
echo "/////////////////////////////////////////////////////////////////////////////"
echo "//////////////////////// Created by Witty Judge /////////////////////////////"
echo "/////////////// https://github.com/WIttyJudge/setup-linux ///////////////////"
echo "//////////////////////// Setup linux ////////////////////////////"
echo "/////////////////////////////////////////////////////////////////////////////"
read -n 1 -r -s -p $'/////////////////////// Press any key to continue ///////////////////////////\n\n'

# List of directory names with dotfiles we need to setup
folders=(
	bash
	dunst
  flameshot
	git
	i3
	neofetch
	polybar
	neovim
  rofi
  scripts
	profile
	ranger
	sxiv
	# terminator
)

# GNU Stow is a symlink farm manager. https://www.gnu.org/software/stow
stowit() {
	name=$1
	# -v - see what is going on.
	# -R - purge old links.
	# -t - target.
	stow -v -R -t ~ $name
}

for i in ${folders[@]}; do
	stowit $i
done
