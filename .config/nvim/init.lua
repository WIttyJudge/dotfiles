-- require "core.options"

-- Lazy.nvim plugin manager
-- require "core.plugin_manager"

require("core").load()

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "core.commands"
    require "core.autocmds"
    require "core.mappings"
  end,
})
