local utils = require('custom.utils')

local icons = {
  git_branch = '',
  unsaved = utils.u 'f693',
  locker = utils.u 'f023',

  diagnostic = {
    error = '',
    warn = '',
    hint = '',
    info = '',
    dianostic_header_icon = '  ',
  }
}

return icons
