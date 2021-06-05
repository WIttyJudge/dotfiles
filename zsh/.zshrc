#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#

# Automatically cd into typed directory

colorscript -e monster
# colorscript -e pacman

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

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# # Edit line in with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

source "$HOME/.config/zsh/setup-vim.sh"

###########################################################
## zinit (package manager)
###########################################################

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \

# Git prompt for Zsh
zinit light woefe/git-prompt.zsh

###########################################################
## load my custome promt
###########################################################

source ~/.config/zsh/prompt.sh
