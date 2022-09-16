#!/bin/zsh

# .zprofile is only sourced when zsh is run as login shell.

# This file should set commands and variables which should be set once or which don't need to be updated frequently:
# 1. environment variables to configure tools (flags for compilation, data folder location, etc.)
# 2. configuration which execute commands (like SCONSFLAGS="--jobs=$(( $(nproc) - 1 ))") as it may take some time to execute.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

unsetopt PROMPT_SP

# Default variables
export EDITOR="nvim"
export TERMINAL="st"
export DOTFILES="$HOME/dotfiles"
export BROWSER="firefox"
export DEV_HOME="$HOME/projects"

# This specification defines where these files should be looked for by defining
# one or more base directories relative to which files should be located.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Cleaning
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

export GOPATH="$DEV_HOME/golang"
export PATH=$PATH:$GOPATH/bin

# Rust / Cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME/solargraph"
export PATH="$PATH:$HOME/.rvm/bin"

# Tmux / tpm
export TMUX_PLUGIN_MANAGER_PATH="$XDG_CONFIG_HOME/tmux/plugins/"

# MySQL
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"

# PostgreSQL
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"

# Redis
export REDISCLI_HISTFILE="$XDG_DATA_HOME/rediscli_history"

# zsh + tools
export ZDOTDIR="$XDG_CONFIG_HOME/zsh" # Change default folder of zsh config.
export ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
export ZIM_HOME="$XDG_DATA_HOME/zim"

# Use 'bat' as manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# nvim as manpager
export MANPAGER="nvim +Man!"

# FZF
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --cycle"
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# security
#export GPG_TTY=$(tty)

# Fixing misbehaving Java applications
export AWT_TOOLKIT="MToolkit wmname LG3D" # May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# asdf
[[ -f "$HOME/.asdf/asdf.sh" ]] && source "$HOME/.asdf/asdf.sh"

# This is the list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"
