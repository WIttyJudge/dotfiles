local opt = vim.opt
local g = vim.g

-- Set leader key
g.mapleader = " "
g.maplocalleader = " "

-- global statusline
opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorlineopt = "number"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false

-- ui
opt.pumheight = 10
opt.scrolloff = 999
opt.sidescrolloff = 8
opt.showtabline = 2
-- Preview substitutions live, as you type 
opt.inccommand = "split"
-- opt.colorcolumn = "79"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
-- opt.termguicolors = true
opt.timeoutlen = 300
opt.updatetime = 250

-- Enable integrated undo.
opt.undofile = true
opt.undodir = vim.fn.stdpath("cache") .. "/undo"

-- I don't need swap file and backups
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- disable nvim intro
opt.shortmess:append "sI"
