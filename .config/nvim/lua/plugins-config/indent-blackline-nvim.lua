-- https://github.com/lukas-reineke/indent-blankline.nvim

vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_filetype_exclude = {
  'help', 'man', 'startify', 'packer', 'NvimTree', 'Trouble', 'dashboard', 'alpha'
}
vim.g.indent_blankline_char = '¦'

require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
    show_end_of_line = true,
    space_char_blankline = " "
}
