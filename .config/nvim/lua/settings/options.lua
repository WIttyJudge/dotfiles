-- Read more:
-- https://github.com/nanotee/nvim-lua-guide#using-meta-accessors

local default_options = {
  -- DEFAULTS
  encoding = 'UTF-8', -- Always use UTF-8
  fileencoding = 'UTF-8',
  clipboard = 'unnamedplus', -- Copy paste between vim and everything else

  -- INDENT OPTIONS
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smarttab = true,
  smartindent = true,
  autoindent = true,

  -- SEARCH OPTIONS
  ignorecase = true, -- Case insensitive searching
  smartcase = true, -- Case-sensitive if expresson contains a capital letter
  hlsearch = true, -- Highlight search results

  -- COMPLETION OPTIONS
  updatetime = 200,
  completeopt = 'menuone,noinsert,noselect',
  -- Remove `Pattern not found` nvim-compe
  pumheight = 10, -- Make pop up menu smaller

  -- LINE OPTIONS
  scrolloff = 7,
  number = true,
  relativenumber = true,
  textwidth = 120,
  linebreak = true,
  -- wrap = true, Set automatic wrapping to new line if characters more then 80
  -- colorcolumn = "80",
  signcolumn = 'yes',
  cursorline = true, -- Enable highlighting on the current_line

  -- STATUSLINE, TABLINE, MESSAGES
  laststatus = 2, -- Always display the status line
  showtabline = 2,  -- Always show tables
  cmdheight = 2, -- More space for displaying messages

  mouse = 'a', -- Enable mouse

  -- For better experience this session manager
  -- sessionoptions='blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal'

  splitbelow = true, -- Horizontal splits will open below
  splitright = true, -- Vertical splits will open  right

  -- Enable the integrated undo features.
  undofile = true,
  undolevels = 500,
  undodir = vim.fn.stdpath('cache') .. '/undo',

  -- I don't need swap file and backups
  swapfile = false,
  backup = false,
  writebackup = false,

  showmode = false, -- We don't need to see things like -- INSERT -- anymore

  -- Buffer/Tabs/Windows
  hidden = true,

  fixeol = true,

  -- Auto-reloading a file as it changed on disk
  autoread = true
}

-- Enables syntax highlighing
vim.cmd([[ syntax enable ]])
vim.cmd([[ filetype plugin on ]])

vim.opt.shortmess:append('c')
vim.o.sessionoptions = 'buffers,curdir,folds,tabpages,winsize'

-- Stop newline continution of comments
vim.opt.formatoptions:remove('c', 'r', 'o', 'l')
vim.opt.formatoptions:append('t')

for k, v in pairs(default_options) do
  vim.opt[k] = v
end
