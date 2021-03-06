local gl = require('galaxyline')
local gls = gl.section

local condition = require('galaxyline.condition')

local custom_functions = require('custom.functions')
local custom_condition = require('custom.conditions')
local utils = require('custom.utils')

-- helper functions

local function add_space(number)
  gls.right[number] = {
    Space = {
      provider = function () return ' ' end
    }
  }
end

gl.short_line_list = {
  'NvimTree',
  'fern',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame',
  'gitcommit',
  'help'
}

local icons = {
  unsaved = utils.u 'f693',
  locker = utils.u 'f023',
}

-- gruvbox-material
local colors = {
  bg = '#282828',
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
  v ='VISUAL',
  c  = 'COMMAND',
  ['r?'] = ':CONFIRM',
  rm = '--MORE',
  R  = 'REPLACE',
  Rv = 'VIRTUAL',
  s  = 'SELECT',
  S  = 'SELECT',
  ['r']  = 'HIT-ENTER',
  [''] = 'SELECT',
  t  = 'TERMINAL',
  ['!']  = 'SHELL'
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
  ce=colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ['r?'] = colors.cyan,
  ['!']  = colors.red,
  t = colors.red
}

-- CONDITIONS

function has_file_type()
  local f_type = vim.bo.filetype

  if not f_type or f_type == '' then
      return false
  end

  return true
end

-- BAR

gls.left[1] = {
  ViMode = {
    provider = function()
      vim.api.nvim_command('hi GalaxyViMode guibg='..vi_mode_color[vim.fn.mode()])

      return '  ' .. vi_mode_text[vim.fn.mode()] .. ' '
    end,
    separator = ' ',
    separator_highlight = {colors.yellow,function()
      if not condition.buffer_not_empty() then
        return colors.bg
      end
      return colors.bg
    end},
    highlight = { colors.bg, colors.bg, 'bold' },
  }
}

gls.left[2] = {
  FileName = {
    -- provider = 'FileName',
    provider = function()
      -- if condition.hide_in_width() then
      --   return vim.fn.expand("%:F")
      -- end

      -- eg. galaxyline.lua
      local f_name = vim.fn.expand("%:t")

      if vim.bo.readonly then
        f_name = f_name .. ' ' .. icons.locker
      end

      if vim.bo.modified then
        f_name = f_name .. ' ' .. icons.unsaved
      end

      return f_name
    end,
    condition = condition.buffer_not_empty,
    separator = ' ',
    separator_highlight = { colors.gray, colors.bg },
    highlight = { colors.gray, colors.bg, 'bold' }
  }
}

-- Git Status

-- LSP 

gls.left[3] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg, 'bold'}
  }
}
gls.left[4] = {
  Space = {
    provider = function () return '' end
  }
}
gls.left[5] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg, 'bold'},
  }
}
gls.left[5] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '   ',
    highlight = {colors.blue,colors.bg, 'bold'},
  }
}
gls.left[6] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '   ',
    highlight = {colors.blue, colors.bg, 'bold'},
    separator = ' '
  }
}

-- RIGHT

gls.right[1] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    -- separator = ' ',
    -- separator_highlight = {colors.purple,colors.bg},
    icon = '+',
    highlight = {colors.green, colors.bg, 'bold'},
  }
}

gls.right[2] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    -- separator = ' ',
    -- separator_highlight = {colors.purple,colors.bg},
    icon = ' ~',
    highlight = {colors.blue,colors.bg, 'bold'},
  }
}

gls.right[3] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    -- separator = ' ',
    -- separator_highlight = {colors.purple,colors.bg},
    icon = ' -',
    highlight = {colors.red,colors.bg, 'bold'},
  }
}

add_space(4)

gls.right[5] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = condition.check_git_workspace,
    highlight = { colors.orange, colors.bg },
  }
}

gls.right[6] = {
  GitBranch = {
    provider = 'GitBranch',
    separator = ' ',
    separator_highlight = { colors.purple, colors.bg },
    condition = condition.check_git_workspace,
    highlight = { colors.yellow, colors.bg, 'bold' },
  }
}

add_space(7)

gls.right[8] = {
  FileIcon = {
    separator = ' ',
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg, 'bold' },
    separator_highlight = { colors.yellow, colors.bg, 'bold' },
  },
}

gls.right[9] = {
  FileTypeName = {
    separator = '',
    provider = 'FileTypeName',
    condition = condition.buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg, 'bold' },
    separator_highlight = { colors.yellow, colors.bg, 'bold' },
  },
}

add_space(10)

-- gls.right[3] = {
--   FileSize = {
--     provider = 'FileSize',
--     condition = condition.buffer_not_empty,
--     separator = ' ',
--     separator_highlight = {colors.yellow,colors.bg, 'bold'},
--     highlight = {colors.darkblue,colors.bg, 'bold'}
--   }
-- }

gls.right[11] = {
  Ruby = {
    separator = ' ',
    condition = function() 
      local extension = vim.fn.expand('%:e')

      if extension ~= 'rb' then
        return false
      end

      return true
    end,
    provider = function()
      local extension = vim.fn.expand('%:e')
      return ' ' .. vim.fn['rvm#string']() .. ' '
    end,
    separator_highlight = {colors.yellow, colors.bg, 'bold'},
    highlight = {colors.red, colors.bg, 'bold'}
  },
}

gls.right[12] = {
  CursorPosition = {
    provider = function()
      return string.format('%s:%s', vim.fn.line('.'), vim.fn.virtcol('.'))
    end,
    separator = ' ',
    highlight = { colors.fg, colors.bg },
  }
}

gls.right[13] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.yellow,colors.bg, 'bold'},
    highlight = {colors.grey,colors.bg},
  }
}

-- SHORT BAR

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    condition = has_file_type,
    separator = ' ',
    separator_highlight = {colors.purple,colors.bg, 'bold'},
    highlight = {colors.bg,colors.yellow,'bold'}
  }
}

-- gls.short_line_right[2] = {
--   BufferIcon = {
--     provider = 'BufferIcon',
--     highlight = {colors.fg, colors.bg}
--   }
-- }

-- gls.short_line_right[1] = {
--   BufferIcon = {
--     provider= 'BufferIcon',
--     condition = has_file_type,
--     separator_highlight = {colors.purple,colors.bg},
--     highlight = {colors.fg,colors.purple}
--   }
-- }
