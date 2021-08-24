-- Read more:
-- https://github.com/nanotee/nvim-lua-guide#using-meta-accessors

local opt = vim.opt

-- local opt_global= vim.opt_global
-- local opt_local= vim.opt_local

-- Enables syntax highlighing
vim.cmd([[ syntax enable ]])
vim.cmd([[ filetype plugin on ]])

-- DEFAULTS
-- Always use UTF-8
opt.encoding = 'UTF-8'
opt.fileencoding = 'UTF-8'
-- Copy paste between vim and everything else
opt.clipboard = 'unnamedplus'

-- INDENT OPTIONS
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true

-- SEARCH OPTIONS
-- Case insensitive searching
opt.ignorecase = true
-- Case-sensitive if expresson contains a capital letter
opt.smartcase = true
-- Highlight search results
opt.hlsearch = true

-- COMPLETION OPTIONS
opt.updatetime = 200
opt.completeopt = 'menuone,noinsert,noselect'
-- Remove `Pattern not found` nvim-compe
opt.shortmess:append('c')
-- Make pop up menu smaller
opt.pumheight = 10

-- LINE OPTIONS
opt.scrolloff = 10
opt.number = true
opt.relativenumber = true
opt.textwidth = 120
opt.linebreak = true
-- Set automatic wrapping to new line if characters more then 80
-- opt.wrap = true
-- opt.colorcolumn = 80
opt.signcolumn = 'yes'
-- Enable highlighting on the current_line
opt.cursorline = true

-- STATUSLINE, TABLINE, MESSAGES
-- Always display the status line
opt.laststatus = 2
-- Always show tables
opt.showtabline = 2  
-- More space for displaying messages
opt.cmdheight = 2

-- Enable mouse
opt.mouse = 'a'

-- Horizontal splits will open below
opt.splitbelow = true
-- Vertical splits will open  right
opt.splitright = true

-- Enable the integrated undo features.
opt.undofile = true
opt.undolevels = 500
opt.undodir = '/home/wittyjudge/.vim/undo'

-- I don't need swap file and backups
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- We don't need to see things like -- INSERT -- anymore
opt.showmode = false

-- Buffer/Tabs/Windows
opt.hidden = true

opt.fixeol = true

-- Stop newline continution of comments
opt.formatoptions:remove('c', 'r', 'o', 'l')
opt.formatoptions:append('t')

