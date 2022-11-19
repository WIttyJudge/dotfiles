local options = {
  clipboard = "unnamedplus", -- Connection to the system clipboard

  -- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
  fillchars = { eob = " ", fold = "‧" },

  -- indent options
  tabstop = 2, -- Number of space in a tab
  shiftwidth = 2, -- Number of space inserted for indentation
  softtabstop = 2, -- Number of space inserted for indentation
  expandtab = true, -- Enable the use of space in tab
  smartindent = true,

  -- search options
  ignorecase = true, -- Case insensitive searching
  smartcase = true, -- Case-sensitive if expresson contains a capital letter

  -- perfomance
  updatetime = 200, -- Length of time to wait before triggering the plugin
  timeoutlen = 300, -- Length of time to wait for a mapped sequence
  ttimeoutlen = 10, -- Length of time to wait for a key code sequence to complete.

  -- completion options
  -- completeopt = 'menuone,noinsert,noselect',
  completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
  pumheight = 10, -- Height of the pop up menu

  -- ui
  number = true, -- Show numberline
  relativenumber = true, -- Show relative numberline
  numberwidth = 2, -- Minimal number of columns to use for the line number.
  ruler = false,
  cursorline = true, -- Enable highlighting on the current_line
  signcolumn = "yes", -- Always show the sign column
  laststatus = 3, -- globalstatus
  -- wrap = true, Set automatic wrapping to new line if characters more then 80
  scrolloff = 7, -- Number of lines to keep above and below the cursor
  sidescrolloff = 7, -- Number of columns to keep at the sides of the cursor
  showmode = false, -- Disable showing modes in command line
  mouse = "a", -- Enable mouse support
  splitbelow = true, -- Splitting a new window below the current one
  splitright = true, -- Splitting a new window at the right of the current one
  showtabline = 2, -- Always show tables
  -- colorcolumn = "79",

  -- Enable the integrated undo features.
  undofile = true, -- Enable persistent undo
  undodir = vim.fn.stdpath "cache" .. "/undo",

  -- I don't need swap file and backups
  swapfile = false, -- Disable use of swapfile for the buffer
  backup = false,
  writebackup = false, -- Disable making a backup before overwriting a file
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
