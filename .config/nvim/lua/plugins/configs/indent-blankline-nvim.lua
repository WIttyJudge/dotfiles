-- https://github.com/lukas-reineke/indent-blankline.nvim
local present, indent_blankline = pcall(require, "indent_blankline")

if not present then
  return
end

local config = {
  buftype_exclude = { "terminal", "README.md" },
  filetype_exclude = {
    "help",
    "man",
    "startify",
    "packer",
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
  -- char = '¦',
  char = "│",

  show_trailing_blankline_indent = false,
  show_current_context = false,
}

indent_blankline.setup(config)
