#!/bin/zsh

# .zprofile is only sourced when zsh is run as login shell.

# This file should set commands and variables which should be set once or which don't need to be updated frequently:
# 1. environment variables to configure tools (flags for compilation, data folder location, etc.)
# 2. configuration which execute commands (like SCONSFLAGS="--jobs=$(( $(nproc) - 1 ))") as it may take some time to execute.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

unsetopt PROMPT_SP

# Default apps
export EDITOR="nvim"
export TERMINAL="alacritty"
export DOTFILES="$HOME/dotfiles"
export BROWSER="brave"

# This specification defines where these files should be looked for by defining
# one or more base directories relative to which files should be located.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
# export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export LESSHISTFILE="-" # stop storing search in the .lessst

# Other program settings:
# nvim as manpager
# export MANPAGER="nvim -c 'set ft=man' -"
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Use 'bat' as manpager
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export AWT_TOOLKIT="MToolkit wmname LG3D"	# May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# root
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

# my folder
export GOPATH=$HOME/projects/golang
export PATH=$PATH:$GOPATH/bin

# libs from golang
# export GOPATH=$HOME/golib

