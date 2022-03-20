-- https://github.com/folke/trouble.nvim

local icons = require('internal.icons')

local config = {
  fold_open = icons.folder.arrow_open,  -- icon used for open folds
  fold_closed = icons.folder.arrow_closed, -- icon used for closed folds

  action_keys = { -- key mappings for actions in the trouble list
    -- map to {} to remove a mapping, for example:
    -- close = {},
    refresh = "r", -- manually refresh
    jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
    open_split = { "b" }, -- open buffer in new split
    open_vsplit = { "v" }, -- open buffer in new vsplit
    open_tab = { "t" }, -- open buffer in new tab
    jump_close = { "o" }, -- jump to the diagnostic and close the list
    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
  },

  auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  auto_fold = false, -- automatically fold a file trouble list at creation

  signs = {
    error = icons.error,
    warning = icons.warning,
    hint = icons.hint,
    information = icons.info,
    other = "﫠"
  },
  use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

require("trouble").setup(config)
