-- https://github.com/stevearc/aerial.nvim
return {
  "stevearc/aerial.nvim",
  cmd = { "AerialToggle" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = require("core.plugin_mappings").aerial,
  opts = {
    attach_mode = "global",
    layout = {
      win_opts = {
        winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
        signcolumn = "yes",
        statuscolumn = " ",
      },
    },
  },
}
