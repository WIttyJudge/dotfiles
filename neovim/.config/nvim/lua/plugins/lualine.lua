-- https://github.com/hoob3rt/lualine.nvim

local lualine = require('lualine')
local lualine_highlight = require('lualine.highlight')

local devicons = require('nvim-web-devicons')

local custom_condition = require('custom.conditions')
local custom_function = require('custom.functions')
local icons = require('custom.icons')

-- gruvbox-material
local colors = {
  bg = '#282828',
  fg = '#ddc7a1',
  yellow = '#d8a657',
  cyan = '#89b482',
  darkblue = '#45707a',
  green = '#a9b665',
  orange = '#e78a4e',
  purple = '#d3869b',
  magenta = '#c14a4a',
  grey = '#a89984',
  blue = '#7daea3',
  red = '#ea6962'
}

local vi_mode_text = {
  n = 'NORMAL',
  i = 'INSERT',
  c = 'COMMAND',
  V = 'VISUAL',
  [''] = 'VISUAL',
  v = 'VISUAL',
  c = 'COMMAND',
  ['r?'] = ':CONFIRM',
  rm = '--MORE',
  R = 'REPLACE',
  Rv = 'VIRTUAL',
  s = 'SELECT',
  S = 'SELECT',
  ['r'] = 'HIT-ENTER',
  [''] = 'SELECT',
  t = 'TERMINAL',
  ['!'] = 'SHELL'
}

local vi_mode_color = {
  n = colors.yellow,
  i = colors.green,
  v = colors.blue,
  [''] = colors.blue,
  V = colors.blue,
  c = colors.purple,
  no = colors.magenta,
  s = colors.orange,
  S = colors.orange,
  [''] = colors.orange,
  ic = colors.yellow,
  R = colors.red,
  Rv = colors.red,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ['r?'] = colors.cyan,
  ['!'] = colors.red,
  t = colors.red
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } }
    },
    disabled_filetypes = {
      'NvimTree',
      'fern',
      'packer',
      'startify',
      'fugitive',
      'fugitiveblame',
      'gitcommit',
      'help'
    }
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {}
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  }
}

-- set color for disabled_filetypes statusline
vim.api.nvim_command("hi StatusLine guibg=" .. colors.bg)
vim.api.nvim_command("hi StatusLineNC guibg=" .. colors.bg)

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    vim.api.nvim_command('hi! LualineMode gui=bold guibg='
                             .. vi_mode_color[vim.fn.mode()] .. " guifg="
                             .. colors.bg)

    return vi_mode_text[vim.fn.mode()]
  end,
  color = "LualineMode"
}

-- ins_left {
--   -- File icon
--   function()
--     local fname, ext = vim.fn.expand '%:t', vim.fn.expand '%:e'
--     local icon, iconhl = devicons.get_icon(fname, ext)

--     if icon == nil then return '' end

--     local fg = vim.fn.synIDattr(vim.fn.hlID(iconhl), 'fg')
--     lualine_highlight.highlight('LualineIcon', fg, colors.bg)

--     return icon
--   end,
--   condition = custom_condition.buffer_not_empty,
--   color = {fg = colors.fg, gui = 'bold'}
-- }

ins_left {
  -- File Name
  function()
    local f_name = vim.fn.expand("%:t")

    if vim.bo.readonly then f_name = f_name .. ' ' .. icons.locker end

    if vim.bo.modified then f_name = f_name .. ' ' .. icons.unsaved end

    return f_name
  end,
  condition = custom_condition.buffer_not_empty,
  color = { fg = colors.fg, gui = 'bold' }
}

ins_left {
  'diagnostics',
  sources = { 'nvim_lsp' },
  symbols = {
    error = icons.diagnostic.error .. ' ',
    warn = icons.diagnostic.warn .. ' ',
    info = icons.diagnostic.info .. ' '
  },
  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.cyan
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
-- ins_left {function() return '%=' end}

-- ins_left {
--   -- Lsp server name .
--   custom_function.get_lsp_client_name,
--   icon = '',
--   color = {fg = colors.fg, gui = 'bold'}
-- }

ins_right {
  'diff',
  symbols = { added = '+', modified = '~', removed = '-' },
  color_added = colors.green,
  color_modified = colors.blue,
  color_removed = colors.red,
  condition = custom_condition.hide_in_width
}

ins_right {
  'branch',
  icon = icons.git_branch,
  condition = custom_condition.check_git_workspace,
  color = { fg = colors.yellow, gui = 'bold' }
}

ins_right { 'filetype' }

-- ruby version
ins_right {
  function()
    return vim.fn['rvm#string']()
  end,
  icon = '',
  condition = function()
    local extension = vim.fn.expand('%:e')

    if extension ~= 'rb' then return false end

    return true
  end,
  color = { fg = colors.red }
}

ins_right { 'location' }

ins_right { 'progress', color = { fg = colors.fg, gui = 'bold' } }

-- Now don't forget to initialize lualine
lualine.setup(config)
