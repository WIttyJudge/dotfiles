#!/usr/bin/env bash

# 1. exit on error.
# 2. treat unset variables as an error.
# 3. the same as 1., but for pipes.
set -euo pipefail

# bold red text in case of error
exec 2> >(while read line; do echo -e "\e[01;31m$line\e[0m"; done)

dotfiles_dir="$(
  cd "$(dirname "$0")"
  pwd
)"
cd "$dotfiles_dir"

link() {
  local orig_path="$dotfiles_dir/$1"
  local dest_path="$HOME/${2:-$1}"

  mkdir -pv "$(dirname "$dest_path")"

  # check if exists and not a symbolic link
  if [ -e "$dest_path" ] && [ ! -L "$dest_path" ]; then
    mv -v "$dest_path" "$dest_path.bak"
  else
    rm -f "$dest_path"
  fi

  ln -sv "$orig_path" "$dest_path"
}

link_all_files_in_folder() {
  local orig_dir="$dotfiles_dir/$1"
  local dest_dir="$HOME/${2:-$1}"

  mkdir -pv "$dest_dir"

  find "$orig_dir" -type f -exec ln -sfv "{}" "$dest_dir" \;
}

link_files_in_folder() {
  local orig_dir="$dotfiles_dir/$1"
  local dest_dir="$HOME/${2:-$1}"

  mkdir -pv "$dest_dir"

  find "$orig_dir" -maxdepth 1 -type f -exec ln -sfv "{}" "$dest_dir" \;
}

is_macos() {
  [ "$(uname -s)" = "Darwin" ]
}

# Prints a short OS label, e.g. "macOS" or "Linux (Arch)".
os_label() {
  if is_macos; then
    echo "macOS"
    return
  fi

  local distro="Linux"
  if [ -f /etc/os-release ]; then
    distro="$(grep -m1 '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')"
    distro="${distro^}"
  fi
  echo "Linux (${distro:-Linux})"
}

welcome_message() {
  local os
  os="$(os_label)"

  echo -e "\e[1;35m╔══════════════════════════════════════╗\e[0m"
  echo -e "\e[1;35m║\e[0m  \e[1;36mSetting up user dotfiles...\e[0m"
  echo -e "\e[1;35m║\e[0m  \e[1;33mDetected OS:\e[0m $os"
  echo -e "\e[1;35m╚══════════════════════════════════════╝\e[0m"
}

welcome_message

# Configs shared between Linux and macOS
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

if is_macos; then
  link ".config/aerospace"
  link ".config/borders"
  link ".config/karabiner/karabiner.json"
  link_files_in_folder ".local/bin"
  link_files_in_folder ".local/bin/tmux"

  exit 0
fi

link ".xinitrc"
link ".xprofile"
link ".Xresources"

link ".config/dunst"
link ".config/foot"
link ".config/gtk-3.0"
link ".config/hypr"
link ".config/nwg-look"
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
link_all_files_in_folder ".local/bin"
link_all_files_in_folder ".local/share/applications"
link_all_files_in_folder ".local/share/icons/fontawesome"
