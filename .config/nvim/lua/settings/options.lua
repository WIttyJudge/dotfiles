-- Read more:
-- https://github.com/nanotee/nvim-lua-guide#using-meta-accessors

-- Enables syntax highlighing
vim.cmd([[ filetype plugin on ]])

vim.opt.shortmess:append('c')
vim.o.sessionoptions = 'buffers,curdir,folds,tabpages,winsize'

-- Stop newline continution of comments
vim.opt.formatoptions:remove('c', 'r', 'o', 'l')
vim.opt.formatoptions:append('t')

local default_options = {
  -- defaults
  encoding = 'UTF-8', -- Always use UTF-8
  syntax = 'enable',
  clipboard = 'unnamedplus', -- Copy paste between vim and everything else

  -- indent options
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smarttab = true,
  smartindent = true,
  autoindent = true,

  -- search options
  ignorecase = true, -- Case insensitive searching
  smartcase = true, -- Case-sensitive if expresson contains a capital letter
  hlsearch = true, -- Highlight search results

  -- perfomance
  updatetime = 200,
  timeoutlen = 400,
  redrawtime = 1500,
  ttimeoutlen = 10,

  -- completion options
  completeopt = 'menuone,noinsert,noselect',
  -- Remove `Pattern not found` nvim-compe
  pumheight = 10, -- Make pop up menu smaller

  -- ui
  number = true,
  relativenumber = true,
  cursorline = true, -- Enable highlighting on the current_line
  signcolumn = 'yes',
  laststatus = 2, -- Always display the status line
  -- wrap = true, Set automatic wrapping to new line if characters more then 80
  scrolloff = 7,
  sidescrolloff = 3, -- Lines to scroll horizontally
  showmode = false, -- We don't need to see things like -- INSERT -- anymore
  mouse = 'a', -- Enable mouse
  splitbelow = true, -- Horizontal splits will open below
  splitright = true, -- Vertical splits will open  right
  colorcolumn = "79",
  -- textwidth = 120,
  -- linebreak = true,

  -- something new
  list = true,
  listchars = {
    tab = '❘-',
    trail = '·',
    lead = '·',
    extends = '»',
    precedes = '«',
    nbsp = '×',
  },

  -- statusline, tabline, messages
  showtabline = 2,  -- Always show tables
  cmdheight = 2, -- More space for displaying messages

  -- Enable the integrated undo features.
  undofile = true,
  undolevels = 500,
  undodir = vim.fn.stdpath('cache') .. '/undo',

  -- I don't need swap file and backups
  swapfile = false,
  backup = false,
  writebackup = false,

  -- Buffer/Tabs/Windows
  -- hidden = true,

  -- fixeol = true,

  -- Auto-reloading a file as it changed on disk
  -- autoread = true
}

for k, v in pairs(default_options) do
  vim.opt[k] = v
end
