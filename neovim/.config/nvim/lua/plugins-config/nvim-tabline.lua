-- look at the folder 'tabline'

local config = {
  show_index = false,    -- show tab index
  show_modify = true,   -- show buffer modification indicator
  modify_icon = "+",   -- show buffer modification indicator
  no_buffer = 'No name' -- no name buffer name
}

require'tabline.tabline'.setp(config)
