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

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Load the aliases and functions 
[ -f "${DOTFILES}/aliases/.aliases" ] && source "${DOTFILES}/aliases/.aliases"
[ -f "${DOTFILES}/aliases/.aliases" ] && source "${DOTFILES}/aliases/.functions"

# Load RVM into a shell session as a function.
[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"

source ~/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
