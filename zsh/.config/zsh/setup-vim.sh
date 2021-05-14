# Activate vim mode.
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Fix backspace bug when switching modes.
bindkey -v '^?' backward-delete-char

function set_beam_cursor() {
  echo -ne '\e[6 q'
}

function set_block_cursor() {
  echo -ne '\e[2 q'
}

# Change cursor shape for different vi modes.
function zle-keymap-select () {
  case $KEYMAP in
    vicmd) set_block_cursor ;;     # block
    viins|main) set_beam_cursor ;; # beam
  esac
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
precmd_functions+=(set_beam_cursor)

