#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#

command -v colorscript >/dev/null 2>&1 && colorscript exec crunch

# source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

####################################
#  Useful options (man zshoptions) #
####################################

# cd without needing "cd"
setopt AUTO_CD

# Append a trailing `/' to all directory names resulting from globbing
setopt MARK_DIRS

# Prompt to confirm rm DIR/*
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# Disable ctrl-s to freeze terminal.
stty stop undef

######################
#  History settings  #
######################

export HISTSIZE=20000
export SAVEHIST=$HISTSIZE
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"

setopt APPEND_HISTORY   # Immediately append commands to history file.
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY   # Immediately append commands to history file.

# setopt HIST_IGNORE_ALL_DUPS # Never add duplicate entries.
setopt HIST_IGNORE_SPACE    # Ignore commands that start with a space.
setopt HIST_FIND_NO_DUPS
# HISTORY_IGNORE="(yt* *|t *|t|sdcv *|mmfileget *|arr)"

setopt GLOB_STAR_SHORT GLOB_DOTS EXTENDED_GLOB

# The number of matches to list without asking first.
export LISTMAX=9999


# ASDF completions
fpath=(${ASDF_DIR}/completions $fpath)

# Basic auto/tab complete:
autoload -U compinit && compinit

zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

# Move .zcompdump to the cache dir.
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$HOST-$ZSH_VERSION"

########################
#  ZIM Plugin manager  #
########################

# Download zimfw plugin manager if missing.

if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"

  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

source ${ZIM_HOME}/init.zsh

zstyle ':zim:zmodule' use 'degit'

######################
#  Plugins Settings  #
######################

# zsh-autosuggestions settings.
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# theme
source ~/.config/zsh/themes/p10k.zsh

############
#  Loader  #
############

# Load custom scripts
if [ -d "$HOME/.local/bin" ] ; then
  PATH=$PATH$(find $HOME/dotfiles/.local/bin -type d -printf ":%p")
fi

# Load aliases
[ -f "$XDG_CONFIG_HOME/shell/aliases" ] && source "$XDG_CONFIG_HOME/shell/aliases"
[ -f "$XDG_CONFIG_HOME/shell/aliase-functions" ] && source "$XDG_CONFIG_HOME/shell/aliase-functions"

##############
#  Mappings  #
##############

# Load bindings
source "$XDG_CONFIG_HOME/zsh/bindings/vim.zsh"
source "$XDG_CONFIG_HOME/zsh/bindings/fzf-history-search.zsh"

# # Edit line in with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
