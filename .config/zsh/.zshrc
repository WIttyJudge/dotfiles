#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#

command -v colorscript >/dev/null 2>&1 && colorscript exec crunch

# source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

#  +----------------------------------------------------------+
#  |             Useful options (man zshoptions)              |
#  +----------------------------------------------------------+

# cd without needing "cd"
setopt AUTO_CD

# Append a trailing `/' to all directory names resulting from globbing
setopt MARK_DIRS

# Prompt to confirm rm DIR/*
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

unsetopt PROMPT_SP

# Disable ctrl-s to freeze terminal.
stty stop undef

#  +----------------------------------------------------------+
#  |                     History settings                     |
#  +----------------------------------------------------------+

export HISTSIZE=20000
export SAVEHIST=$HISTSIZE
export HISTFILE="${XDG_DATA_HOME}/zsh_history"

setopt APPEND_HISTORY # Immediately append commands to history file.
setopt INC_APPEND_HISTORY 

setopt HIST_IGNORE_ALL_DUPS  # Never add duplicate entries.
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE    # Delete space and the beginning of command.
setopt HIST_EXPIRE_DUPS_FIRST # Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_FIND_NO_DUPS 
setopt HIST_SAVE_NO_DUPS

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


#  +----------------------------------------------------------+
#  |                    ZIM Plugin manager                    |
#  +----------------------------------------------------------+

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

#  +----------------------------------------------------------+
#  |                     Plugins Settings                     |
#  +----------------------------------------------------------+

# zsh-autosuggestions settings.
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# theme
source ~/.config/zsh/themes/p10k.zsh

#  +----------------------------------------------------------+
#  |                          Loader                          |
#  +----------------------------------------------------------+

# Load aliases
[ -f "$XDG_CONFIG_HOME/shell/aliases" ] && source "$XDG_CONFIG_HOME/shell/aliases"
[ -f "$XDG_CONFIG_HOME/shell/aliase-functions" ] && source "$XDG_CONFIG_HOME/shell/aliase-functions"

#  +----------------------------------------------------------+
#  |                         Mappings                         |
#  +----------------------------------------------------------+

# Load bindings
source "$XDG_CONFIG_HOME/zsh/bindings/vim.zsh"
source "$XDG_CONFIG_HOME/zsh/bindings/fzf-history-search.zsh"

# # Edit line in with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$GEM_HOME/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*
export PATH=$PATH:$(ruby -e 'print Gem.user_dir')/bin
