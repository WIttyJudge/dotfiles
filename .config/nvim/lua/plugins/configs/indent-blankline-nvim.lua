-- https://github.com/lukas-reineke/indent-blankline.nvim
local present, indent_blankline = pcall(require, "indent_blankline")

if not present then
  return
end

local config = {
  buftype_exclude  = { 'terminal', 'README.md' },
  filetype_exclude = {
    'help', 
    'man', 
    'startify', 
    'packer', 
    'NvimTree', 
    'Trouble', 
    'dashboard', 
    'alpha'
  },
  -- char = '¦',
  char_list = { "", "┊", "┆", "¦", "|", "¦", "┆", "┊", "" },
  show_end_of_line = true,
  space_char_blankline = " ",
}

indent_blankline.setup(config)
