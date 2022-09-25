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
    "",
  },
  -- char = '¦',
  char_list = { "", "┊", "┆", "¦", "|", "¦", "┆", "┊", "" },
  -- show_end_of_line = true,
  -- space_char_blankline = " ",

  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
}

indent_blankline.setup(config)
