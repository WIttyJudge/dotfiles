-- https://github.com/mhartington/formatter.nvim

local function rubocop()
  return {
    exe = 'rubocop',
    args = {'--auto-correct', '--stdin', '"%:p"', '2>/dev/null', '|', 'sed "1,/^====================$/d"'},
    stdin = true,
  }
end

local function html() 
  return {
    exe = 'prettier',
    args = {'--stdin-filepath', '"%:p"'},
    stdin = true
  }
end

require('formatter').setup {
  logging = false,
  filetype = {
    ruby = { rubocop },
    html = { html },
  },
}
