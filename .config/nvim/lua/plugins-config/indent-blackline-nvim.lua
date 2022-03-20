-- https://github.com/lukas-reineke/indent-blankline.nvim

require("indent_blankline").setup {
  buftype_exclude  = { 'terminal', 'README.md' },
  filetype_exclude = {
    'help', 'man', 'startify', 'packer', 'NvimTree', 'Trouble', 'dashboard', 'alpha'
  },
  -- char = '¦',
  char_list = { "", "┊", "┆", "¦", "|", "¦", "┆", "┊", "" },
  show_end_of_line = true,
  space_char_blankline = " ",
}
