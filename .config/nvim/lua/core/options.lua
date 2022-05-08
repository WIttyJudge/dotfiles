local options = {
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
  laststatus = 3, -- Always display the status line
  -- wrap = true, Set automatic wrapping to new line if characters more then 80
  scrolloff = 7,
  sidescrolloff = 5, -- Lines to scroll horizontally
  showmode = false,  -- We don't need to see things like -- INSERT -- anymore
  mouse = 'nv',      -- Enable mouse only for visual and normat mode.
  splitbelow = true, -- Horizontal splits will open below
  splitright = true, -- Vertical splits will open  right
  colorcolumn = "79",

  -- something new
  -- list = true,
  -- listchars = {tab='●·', extends='→', precedes='←', trail='■'},

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
}

-- Enables syntax highlighing
-- vim.cmd([[ filetype plugin on ]])

vim.opt.shortmess:append('c')
vim.opt.fillchars:append { eob = " ", fold='‧' }

-- Stop newline continution of comments
vim.opt.formatoptions:remove('c', 'r', 'o', 'l')
vim.opt.formatoptions:append('t')

-- vim.o.sessionoptions = 'buffers,curdir,folds,tabpages,winsize'

for k, v in pairs(options) do
  vim.opt[k] = v
end
