-- Options

-- Read more:
-- https://github.com/nanotee/nvim-lua-guide#using-meta-accessors

local opt = vim.opt
-- local opt_global= vim.opt_global
-- local opt_local= vim.opt_local

-- Enables syntax highlighing
vim.cmd([[ syntax enable ]])
vim.cmd([[ filetype plugin on ]])

-- Set default encoding
opt.encoding = 'UTF-8'
-- The encoding written to file
opt.fileencoding = 'UTF-8'
-- Convert tab to space
opt.expandtab = true
-- Change the number of space characters inserted for indentation
opt.shiftwidth = 2
-- Insert 2 spaces for a tab
opt.tabstop = 2
-- Line numbers
opt.number = true
opt.relativenumber = true
-- Keep 7 lines below and above the cursor
opt.scrolloff = 10
-- opt.colorcolumn = 80
opt.signcolumn = 'yes'
opt.fixeol = true

-- Required to keep multiple buffers open multiple buffers
opt.hidden = true
-- Make pop up menu smaller
opt.pumheight = 10
-- More space for displaying messages
opt.cmdheight = 2

-- Enable mouse
opt.mouse = 'a'

-- Horizontal splits will automatically be below
opt.splitbelow = true
-- Vertical splits will automatically be to the right
opt.splitright = true

-- So that I can see `` in markdown files
opt.conceallevel = 0       

opt.smarttab = true
opt.smartindent = true
opt.autoindent = true
-- Always display the status line
opt.laststatus = 2
-- Always show tables
opt.showtabline = 2  
-- Enable highlighting on the current_line
opt.cursorline = true
-- We don't need to see things like -- INSERT -- anymore
opt.showmode = false

-- I don't need swap file and backups
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Faster completion
opt.updatetime = 100         
-- By default timeoutlen is 1000ms
opt.timeoutlen = 500        
-- Stop newline continution of comments
opt.formatoptions:remove({ 'c', 'r', 'o', 'l' })
opt.formatoptions:append({ t = true })

-- Copy paste between vim and everything else
opt.clipboard = 'unnamedplus'
-- Autocomplete
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
-- Remove `Pattern not found` nvim-compe
opt.shortmess:append({ c = true })

-- Save undo history to the file.
opt.undofile = true
opt.undolevels = 100
opt.undodir = '/home/wittyjudge/.vim/undo'

-- SEARCHING
-- Case insensitive searching
opt.ignorecase = true
-- Case-sensitive if expresson contains a capital letter
opt.smartcase = true
-- Highlight search results
opt.hlsearch = true

-- Set automatic wrapping to new line if characters more then 80
opt.textwidth = 80
opt.wrapmargin = 0
opt.wrap = true
opt.linebreak = true

