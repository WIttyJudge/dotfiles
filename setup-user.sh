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

is_macos() {
  [ "$(uname -s)" = "Darwin" ]
}

echo "==========================="
echo "Setting up user dotfiles..."
echo "==========================="

# Configs shared between Linux and macOS
link ".bashrc"
link ".profile"
link ".zprofile"

link ".config/alacritty"
link ".config/git"
link ".config/htop"
link ".config/lazygit"
link ".config/nvim"
link ".config/shell"
link ".config/tmux"
link ".config/zsh"

link_all_files_in_folder ".local/bin"

if is_macos; then
  echo "Detected macOS, skipping Linux-only (X11/Wayland/XDG) configs."
  exit 0
fi

link ".xinitrc"
link ".xprofile"
link ".Xresources"

link ".config/dunst"
link ".config/foot"
link ".config/gtk-3.0"
link ".config/hypr"
link ".config/pcmanfm"
link ".config/rofi"
link ".config/swappy"
link ".config/waybar"
link ".config/zathura"
link ".config/mimeapps.list"
link ".config/pavucontrol.ini"
link ".config/user-dirs.dirs"

# X11 related config files
# link ".config/bspwm"
# link ".config/nsxiv"
# link ".config/picom"
# link ".config/polybar"
# link ".config/sxhkd"

link ".local/share/bg"
link_all_files_in_folder ".local/share/applications"
link_all_files_in_folder ".local/share/icons/fontawesome"
