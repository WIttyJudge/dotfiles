-- https://github.com/lukas-reineke/indent-blankline.nvim
local indent_blankline = require("indent_blankline")

local config = {
  -- buftype_exclude = { "terminal", "README.md" },
  filetype_exclude = {
    "help",
    "man",
    "NvimTree",
    "Trouble",
    "dashboard",
    "alpha",
    "terminal",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "lsp-installer",
    "mason",
    "lazy",
    "",
  },
  char = "│",

  show_trailing_blankline_indent = false,
  show_current_context = false,
}

indent_blankline.setup(config)
