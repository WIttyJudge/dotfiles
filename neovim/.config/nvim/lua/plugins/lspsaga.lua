-- https://github.com/glepnir/lspsaga.nvim

local icons = require('custom.icons')

config = {
  error_sign = icons.diagnostic.error,
  warn_sign = icons.diagnostic.warn,
  hint_sign = icons.diagnostic.hint,
  infor_sign = icons.diagnostic.info,
  dianostic_header_icon = icons.diagnostic.header_icon,
}

require('lspsaga').init_lsp_saga(config)

