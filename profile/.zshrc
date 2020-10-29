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

# A colon-separated list of values controlling how commands are saved on the history list.
# If the list of values includes ignorespace, lines which begin with a space character are not saved in the history list. A value of ignoredups causes lines matching the previous history entry to not be saved. A value of ignoreboth is shorthand for ignorespace and ignoredups. 
# A value of erasedups causes all previous lines matching the current line to be removed from the history list before that line is saved. 
HISTCONTROL=ignoreboth:erasedups

# Infinite history.
HISTSIZE=
HISTFILESIZE=

# Load the aliases and functions 
[ -f "${DOTFILES}/aliases/.aliases" ] && source "${DOTFILES}/aliases/.aliases"
[ -f "${DOTFILES}/aliases/.aliases" ] && source "${DOTFILES}/aliases/.functions"

# Load RVM into a shell session as a function.
[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
