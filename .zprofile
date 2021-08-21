#!/bin/zsh

# .zprofile is only sourced when zsh is run as login shell.

# This file should set commands and variables which should be set once or which don't need to be updated frequently:
# 1. environment variables to configure tools (flags for compilation, data folder location, etc.)
# 2. configuration which execute commands (like SCONSFLAGS="--jobs=$(( $(nproc) - 1 ))") as it may take some time to execute.

# Adds `~/.local/bin` to $PATH
export PATH="$HOME/.local/bin:$PATH"

# Default apps
export EDITOR="nvim"
export TERMINAL="alacritty"
export DOTFILES="$HOME/dotfiles"
export MAIN_BROWSER="brave"
export FIRST_ALTERNATIVE_BORWSER="chromium"

# Use 'bat' as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# nvim as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

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

