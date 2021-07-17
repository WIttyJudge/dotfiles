-- Options

local opt = vim.opt

opt.encoding = 'UTF-8'
opt.fileencoding = 'UTF-8'
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.number = true
opt.relativenumber = true
opt.scrolloff = 7
-- opt.colorcolumn = 80
opt.signcolumn = 'yes'
opt.nofixeol

opt.hidden = true
opt.pumheight = 10
opt.cmdheight = 2
-- opt.iskeyword+=-
opt.mouse = 'a'
opt.splitbelow = true
opt.splitright = true
opt.t_Co = 256
opt.conceallevel = 0       
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true
opt.laststatus = 2     
opt.cursorline = true
opt.showtabline = 2  
opt.noshowmode = true
opt.noswapfile = true
opt.nobackup = true
opt.nowritebackup = true
opt.updatetime = 100         
opt.timeoutlen = 500        
opt.formatoptions:append { t = true, c = false, r = false, o = false, l = false }
opt.clipboard = 'unnamedplus'
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
opt.shortmes:append { c = true }


-- Save undo history to the file.
opt.undofile = true
opt.undolevels = 100
opt.undodir = '~/.vim/undo'

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

opt.textwidth = 80
opt.wrapmargin = 0
opt.wrap = true
opt.linebreak = true
