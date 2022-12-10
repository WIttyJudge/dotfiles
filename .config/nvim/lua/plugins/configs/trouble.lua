-- https://github.com/folke/trouble.nvim
local present, trouble = pcall(require, "trouble")

if not present then
  return
end

local icons = require "internal.icons"

local config = {
  fold_open = icons.folder.arrow_open, -- icon used for open folds
  fold_closed = icons.folder.arrow_closed, -- icon used for closed folds

  action_keys = { -- key mappings for actions in the trouble list
    -- map to {} to remove a mapping, for example:
    -- close = {},
    open_split = { "b" }, -- open buffer in new split
    open_vsplit = { "v" }, -- open buffer in new vsplit
    open_tab = { "t" }, -- open buffer in new tab
    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
  },

  use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
}

trouble.setup(config)
