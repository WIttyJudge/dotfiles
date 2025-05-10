-- https://github.com/folke/trouble.nvim
local icons = require("internal.icons")

return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  config = {
    fold_open = icons.fold.Opened,
    fold_closed = icons.fold.Closed,

    -- key mappings for actions in the trouble list.
    -- map to {} to remove a mapping.
    action_keys = {
      open_split = { "b" },
      open_vsplit = { "v" },
      open_tab = { "t" },
      -- toggle between "workspace" and "document" diagnostics mode
      toggle_mode = "m",
    },
    -- enabling this will use the signs defined in your lsp client.
    use_diagnostic_signs = true,
  },
}
