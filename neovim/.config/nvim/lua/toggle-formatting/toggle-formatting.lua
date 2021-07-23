local formatter_config = require('formatter.config')

local _GLOBAL_CONFIG = {
  enable = false,
}

local M = {}

function M.toggle_formatting(option)
  if option ~= true then
    return 
  end

  local keysets = {}
  for k, _ in pairs(formatter_config.values.filetype) do
    table.insert(keysets, '*.' .. k)
  end

  local filetypes = table.concat(keysets, ',')

  vim.api.nvim_exec([[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost ]] .. filetypes ..  [[ FormatWrite
    augroup END
  ]], true)

end

function M.setup(cfg)
  local cfg = cfg or {}

  local _GLOBAL_CONFIG = vim.tbl_extend('force', _GLOBAL_CONFIG, cfg)

  M.toggle_formatting(_GLOBAL_CONFIG.enable)
end

return M
