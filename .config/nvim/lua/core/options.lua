local options = {
  clipboard = "unnamedplus", -- Connection to the system clipboard

  -- indent options
  expandtab = true,
  smartindent = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,

  fillchars = { eob = " " },
  ignorecase = true,
  smartcase = true,
  mouse = "a",

  -- perfomance
  updatetime = 200, -- Length of time to wait before triggering the plugin
  timeoutlen = 300, -- Length of time to wait for a mapped sequence
  ttimeoutlen = 10, -- Length of time to wait for a key code sequence to complete.
  splitkeep = 'screen',

  -- completion options
  -- completeopt = 'menuone,noinsert,noselect',
  completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
  pumheight = 10, -- Height of the pop up menu

  -- ui
  number = true,
  numberwidth = 2,    -- Minimal number of columns to use for the line number.
  ruler = false,
  relativenumber = true,
  cursorline = true,  -- Enable highlighting on the current_line
  signcolumn = "yes", -- Always show the sign column
  laststatus = 3,     -- globalstatus
  scrolloff = 7,      -- Number of lines to keep above and below the cursor
  sidescrolloff = 7,  -- Number of columns to keep at the sides of the cursor
  showmode = false,   -- Disable showing modes in command line
  splitbelow = true,  -- Splitting a new window below the current one
  splitright = true,  -- Splitting a new window at the right of the current one
  showtabline = 2,    -- Always show tables
  termguicolors = true,
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
