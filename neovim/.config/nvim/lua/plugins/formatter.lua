-- https://github.com/mhartington/formatter.nvim
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

local function prettier_css()
  return {
    exe = 'prettier',
    args = { '--stdin-filepath', '"%:p"', '--parser', 'css' },
    stdin = true
  }
end

local function shfmt()
  return { exe = 'shfmt', args = { '"%:p"' }, stdin = true }
end

local function prettier_json()
  return {
    exe = 'prettier',
    args = { '--stdin-filepath', '"%:p"', '--parser', 'json' },
    stdin = true
  }
end

local function lua_format()
  return {
    exe = 'lua-format',
    args = {
      '--no-keep-simple-function-one-line', '--no-break-after-operator',
      '--column-limit=150', '--indent-width=2', '--spaces-inside-table-braces',
      '--break-after-table-lb'
    },
    stdin = true
  }
end

require('formatter').setup {
  logging = false,
  filetype = {
    ruby = { rubocop },
    css = { prettier_css },
    sh = { shfmt },
    json = { prettier_json },
    lua = { lua_format }
  }
}
