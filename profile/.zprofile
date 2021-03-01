#!/bin/zsh

# .zprofile is only sourced when zsh is run as login shell.

# This file should set commands and variables which should be set once or which don't need to be updated frequently:
# 1. environment variables to configure tools (flags for compilation, data folder location, etc.)
# 2. configuration which execute commands (like SCONSFLAGS="--jobs=$(( $(nproc) - 1 ))") as it may take some time to execute.

PATH="$PATH:/$HOME/.local/bin/dmenu"
PATH="$PATH:/$HOME/.local/bin/statusbar"

export EDITOR="nvim"
export TERMINAL="urxvt"

export DOTFILES="$HOME/dotfiles"
