-- https://github.com/mhar tington/formatter.nvim

local current_file_path = vim.api.nvim_buf_get_name(0)

local function rubocop()
  return {
    exe = 'rubocop',
    args = {
      '--auto-correct', '--stdin', '"%:p"', '2>/dev/null', '|',
      'sed "1,/^====================$/d"'
    },
    stdin = true
  }
end

local function lua_format()
  return {
    exe = 'lua-format',
    args = {
      '--no-keep-simple-function-one-line', '--no-break-after-operator',
      '--no-keep-simple-control-block-one-line', '--column-limit=80',
      '--indent-width=2', '--spaces-inside-table-braces',
      '--break-after-table-lb'
    },
    stdin = true
  }
end

local function shfmt()
  return { exe = 'shfmt', args = { '"%:p"' }, stdin = true }
end

local function prettier()
  return {
    exe = 'prettier',
    args = { '--stdin-filepath', current_file_path },
    stdin = true
  }
end

require('formatter').setup {
  logging = false,
  filetype = {
    ruby = { rubocop },
    lua = { lua_format },
    sh = { shfmt },

    html = { prettier },
    css = { prettier},
    scss = { prettier},
    -- javascript = { prettier_javascript },

    json = { prettier},
    yaml = { prettier},
    markdown = { prettier }
  }
}
