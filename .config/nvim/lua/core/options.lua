local opt = vim.opt
local o = vim.opt
local g = vim.g

-- Set <space> as the leader key.
g.mapleader = " "
g.maplocalleader = " "

-- Global statusline shared across all buffers.
o.laststatus = 3
-- Don't show the mode, since it's already in the status line.
o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

-- Show which line your cursor is on.
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting.
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- Enable break indent.
o.breakindent = true

-- Replaces the default '~' characters shown after the end of the buffer.
o.fillchars = { eob = " " }

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term.
o.ignorecase = true
o.smartcase = true

-- Enable mouse mode, can be useful for resizing splits for example.
o.mouse = "a"

-- Make line numbers default.
o.number = true
o.relativenumber = true
-- Minimal number of columns to use for the line number
o.numberwidth = 2

-- Maximum number of items to show in the completion popup menu.
o.pumheight = 10

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 20
-- Minimum number of columns to the left and right of the cursor.
o.sidescrolloff = 8

-- Always show the tabline, even when only one tab is open.
o.showtabline = 2

-- Preview substitutions live, as you type.
o.inccommand = "split"

-- Set border style for floating windows.
o.winborder = 'single'

-- Keep signcolumn on by default.
o.signcolumn = "yes"

-- Configure how new splits should be opened.
o.splitbelow = true
o.splitright = true

-- Decrease mapped sequence wait time.
o.timeoutlen = 300
-- Decrease update time.
o.updatetime = 250

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s).
o.confirm = true

-- Save undo history
o.undofile = true
o.undodir = vim.fn.stdpath("cache") .. "/undo"

-- I don't need swap file and backups
o.swapfile = false
o.backup = false
o.writebackup = false

-- Disable nvim intro
opt.shortmess:append "sI"

-- Disable spelling
o.spell = false

-- Sets how neovim will display certain whitespace characters in the editor.
o.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- the providers are for (neo)vim plugins coded in those languages,
-- by majority of plugins are lua/vimscript so I don't need it.
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
