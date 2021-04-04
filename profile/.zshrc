#          _              
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|
#                       

# load spaceship-prompt theme
# https://github.com/denysdovhan/spaceship-prompt
autoload -U promptinit; promptinit
prompt spaceship

# Automatically cd into typed directory
setopt autocd

# history settings
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_beep
# setopt interactive_comments

# load custom scripts
if [ -d "$HOME/.local/bin" ] ; then
  PATH=$PATH$(find $HOME/dotfiles/scripts/.local/bin -type d -printf ":%p")
fi

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# A colon-separated list of values controlling how commands are saved on the history list.
# If the list of values includes ignorespace, lines which begin with a space character are not saved in the history list. A value of ignoredups causes lines matching the previous history entry to not be saved. A value of ignoreboth is shorthand for ignorespace and ignoredups. 
# A value of erasedups causes all previous lines matching the current line to be removed from the history list before that line is saved. 
HISTCONTROL=ignoreboth:erasedups

# Load the aliases and functions 
[ -f "${DOTFILES}/aliases/.aliases" ] && source "${DOTFILES}/aliases/.aliases"
[ -f "${DOTFILES}/aliases/.aliases" ] && source "${DOTFILES}/aliases/.functions"

# Load RVM into a shell session as a function.
[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"

source ~/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# root
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

# libs from golang
export GOPATH=$HOME/golib

# my folder
export GOPATH=$HOME/code
export PATH=$PATH:$GOPATH/bin

