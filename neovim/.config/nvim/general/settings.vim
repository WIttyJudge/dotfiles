" Basic settings
syntax enable                           " Enables syntax highlighing
set encoding=UTF-8                      " The encoding displayed
set expandtab                           " Converts tabs to spaces
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set tabstop=2                           " Insert 2 spaces for a tab
set number relativenumber               " Line numbers
set scrolloff=7                         " Keep 5 lines below and above the cursor
" set colorcolumn=80
set signcolumn=yes
set termguicolors

set hidden                              " Required to keep multiple buffers open multiple buffers
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set cursorline                          " Enable highlighting of the current line
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set noswapfile                          " I dont need swap file
set nobackup                            
set nowritebackup                      
set updatetime=100                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set completeopt=menuone,noinsert,noselect
set shortmess+=c                        " Remove `Pattern not found` nvim-compe

" Save undo history to the file.
set undofile
set undolevels=100
set undodir=~/.vim/undo

" Searching
set ignorecase                          " Case insensitive searching
set smartcase                           " Case-sensitive if expresson contains a capital letter
set hlsearch                            " Highlight search results

" Set automatic wrapping to new line if characters more then 80
set textwidth=80                        " Maximum width of text that is being inserted.
set wrapmargin=0
set wrap
set linebreak
set formatoptions+=t                    " Rules how to automatically formatting letters
set formatoptions-=l

