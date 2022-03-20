-- https://github.com/glepnir/lspsaga.nvim

local icons = require('internal.icons')

local config = {
  error_sign = icons.error,
  warn_sign = icons.warn,
  hint_sign = icons.hint,
  infor_sign = icons.info,

  code_action_prompt = {
    enable = false,
  }
}

require('lspsaga').init_lsp_saga(config)
