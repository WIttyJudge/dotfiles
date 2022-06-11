#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#

command -v colorscript >/dev/null 2>&1 && colorscript exec monster

# source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# Useful options (man zshoptions) {{{

# cd without needing "cd"
setopt AUTO_CD

# Append a trailing `/' to all directory names resulting from globbing
setopt MARK_DIRS

# Prompt to confirm rm DIR/*
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# Disable ctrl-s to freeze terminal.
stty stop undef

# General zsh behavior }}}

# History settings {{{

setopt INC_APPEND_HISTORY   # Immediately append commands to history file.
setopt EXTENDED_HISTORY     # save each command beginning timestamp and the duration to the history file

setopt HIST_IGNORE_ALL_DUPS # Never add duplicate entries.
setopt HIST_IGNORE_SPACE    # Ignore commands that start with a space.
setopt HIST_FIND_NO_DUPS    # Prevent showing duplicated in find (CTRL-R)
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS   # Remove unnecessary blank lines.
# Remove duplicated commands when $HISTSIZE will be reached
setopt HIST_EXPIRE_DUPS_FIRST

export HIST_STAMPS="mm/dd/yyyy"
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"

# END History }}}

# load custom scripts
if [ -d "$HOME/.local/bin" ] ; then
  PATH=$PATH$(find $HOME/dotfiles/scripts/.local/bin -type d -printf ":%p")
fi

# Load aliases
[ -f "$XDG_CONFIG_HOME/shell/aliases" ] && source "$XDG_CONFIG_HOME/shell/aliases"
[ -f "$XDG_CONFIG_HOME/shell/aliase-functions" ] && source "$XDG_CONFIG_HOME/shell/aliase-functions"

# Basic auto/tab complete:
autoload -U compinit && compinit

zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

# Move .zcompdump to the cache dir.
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# # Edit line in with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# ZIM {{{

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

# END ZIM }}}

# Plugins settings {{{

# zsh-autosuggestions settings.
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# END Plugins settings }}}

# theme
source ~/.config/zsh/themes/p10k.zsh

# load bindings
source "$XDG_CONFIG_HOME/zsh/bindings/vim.zsh"
source "$XDG_CONFIG_HOME/zsh/bindings/fzf-history-search.zsh"
