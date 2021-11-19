local utils = require('custom.utils')

local icons = {
  git_branch = '',
  unsaved = utils.convert_utf8_to_character 'f693',
  locker = utils.convert_utf8_to_character 'f023',

  diagnostic = {
    error = '',
    warn = '',
    hint = '',
    info = '',
    header_icon = '  '
  },

  debug = {
    breakpoint = { text = "→", texthl = "Red", linehl = "", numhl = "" },
    stop = { text = "→", texthl = "Green", linehl = "", numhl = "" }
  }
}

return icons
