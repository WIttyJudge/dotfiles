#!/bin/zsh

# .zprofile is only sourced when zsh is run as login shell.

# This file should set commands and variables which should be set once or which don't need to be updated frequently:
# 1. environment variables to configure tools (flags for compilation, data folder location, etc.)
# 2. configuration which execute commands (like SCONSFLAGS="--jobs=$(( $(nproc) - 1 ))") as it may take some time to execute.

# Adds `~/.local/bin` and all subdirs to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"
export PATH="$PATH:${$(find ~/.local/bin -type d -o -printf %p:)%%:}"

# unsetopt PROMPT_SP

# Default variables
export EDITOR="nvim"
export VISUAL=$EDITOR
export TERMINAL="st"
export WM="dwm"
export READER="zathura"
export BROWSER="firefox"
export MANPAGER="nvim +Man!"

export DEV_HOME="$HOME/projects"
# export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# XDG Base Directory locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Cleaning
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export LESSHISTFILE="$XDG_DATA_HOME/less_history"

# Go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

export GOPATH="$DEV_HOME/golang"
export PATH=$PATH:$GOPATH/bin

# Rust / Cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Ruby
# export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME/solargraph"
export PATH="$PATH:$HOME/.rvm/bin"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"

# Tmux / tpm
export TMUX_PLUGIN_MANAGER_PATH="$XDG_CONFIG_HOME/tmux/plugins/"

# MySQL
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"

# PostgreSQL
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"

# Redis
export REDISCLI_HISTFILE="$XDG_DATA_HOME/rediscli_history"

# sqlite
export SQLITE_HISTORY="${XDG_DATA_HOME}/sqlite_history"

# zsh + tools
export ZDOTDIR="$XDG_CONFIG_HOME/zsh" # Change default folder of zsh config.
export ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
export ZIM_HOME="$XDG_DATA_HOME/zim"

# Wget
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

# FZF
export FZF_DEFAULT_OPTS="--height 75% --layout=reverse --cycle --border"

# security
# export GPG_TTY=$(tty)

# Fixing misbehaving Java applications
export AWT_TOOLKIT="MToolkit wmname LG3D" # May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1

# Openssl fix
export PATH=$HOME/openssl/bin:$PATH
export LD_LIBRARY_PATH=$HOME/openssl/lib
export LC_ALL="en_US.UTF-8"
export LDFLAGS="-L /home/wittyjudge/openssl/lib -Wl,-rpath,/home/wittyjudge/openssl/lib"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# asdf
[[ -f "$HOME/.asdf/asdf.sh" ]] && source "$HOME/.asdf/asdf.sh"
