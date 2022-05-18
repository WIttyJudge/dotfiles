#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|

# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Allow you cd into directory by typing the directory name.
shopt -s autocd


# A colon-separated list of values controlling how commands are saved on the history list.
# If the list of values includes ignorespace, lines which begin with a space character are not saved in the history list. A value of ignoredups causes lines matching the previous history entry to not be saved. A value of ignoreboth is shorthand for ignorespace and ignoredups.
# A value of erasedups causes all previous lines matching the current line to be removed from the history list before that line is saved.
HISTCONTROL=ignoreboth:erasedups

# Infinite history.
export HISTSIZE=10000000
HISTFILESIZE=
export HISTFILE="${XDG_CACHE_HOME}/bash/history"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# [ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"
