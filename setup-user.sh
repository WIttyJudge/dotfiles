#!/usr/bin/env bash

set -e
exec 2> >(while read line; do echo -e "\e[01;31m$line\e[0m"; done)

dotfiles_dir="$(
	cd "$(dirname "$0")"
	pwd
)"
cd "$dotfiles_dir"

link() {
	orig_file="$dotfiles_dir/$1"
	if [ -n "$2" ]; then
		dest_file="$HOME/$2"
	else
		dest_file="$HOME/$1"
	fi

	mkdir -pv "$(dirname "$dest_file")"

	rm -rf "$dest_file"
	ln -sv "$orig_file" "$dest_file"
}

link_all_files_in_folder() {
	orig_dir=$dotfiles_dir/$1
	if [ -n "$2" ]; then
		dest_dir="$HOME/$2"
	else
		dest_dir="$HOME/$1"
	fi

	mkdir -pv $dest_dir

	find $orig_dir -type f -exec ln -sfv "{}" $dest_dir \;
}

echo "==========================="
echo "Setting up user dotfiles..."
echo "==========================="

link ".asdfrc"
link ".bashrc"
link ".profile"
link ".xinitrc"
link ".xprofile"
link ".Xresources"
link ".zprofile"

link ".config/alacritty"
link ".config/bspwm"
link ".config/dunst"
link ".config/foot"
link ".config/git"
link ".config/gtk-3.0"
link ".config/htop"
link ".config/hypr"
link ".config/lazygit"
link ".config/mpv"
link ".config/nsxiv"
link ".config/nvim"
link ".config/pcmanfm"
link ".config/picom"
link ".config/polybar"
link ".config/rofi"
link ".config/shell"
link ".config/swappy"
link ".config/sxhkd"
link ".config/tmux"
link ".config/waybar"
link ".config/wget"
link ".config/zathura"
link ".config/zsh"
link ".config/mimeapps.list"
link ".config/pavucontrol.ini"
link ".config/user-dirs.dirs"

link ".local/share/bg"
link_all_files_in_folder ".local/share/applications"
link_all_files_in_folder ".local/share/icons/fontawesome"
link_all_files_in_folder ".local/bin"
