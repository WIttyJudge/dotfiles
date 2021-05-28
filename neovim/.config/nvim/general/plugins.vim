" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
  " [1] Theme
  " Plug 'doums/darcula'
  Plug 'morhetz/gruvbox'

  " [2] Looking for files
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " [3] Tree explorer
  Plug 'preservim/nerdtree' |
        \ Plug 'jistr/vim-nerdtree-tabs' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'

  " [4] Comment out code
  Plug 'tpope/vim-commentary'

  " [5] Linter
  Plug 'dense-analysis/ale'

  " [6] Multiple select of text
  " Plug 'terryma/vim-multiple-cursors'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " [7] Display vertical lines in code
  Plug 'Yggdroot/indentLine'

  " [8] Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'

  " [9] Simple quoting, parenthesizing
  Plug 'tpope/vim-surround'

  " [10] Statusline, tabline
  Plug 'itchyny/lightline.vim'

  " [11] Shows keybindings in popup
  Plug 'liuchengxu/vim-which-key'

  " [12] Fancy startup screen for vim
  Plug 'mhinz/vim-startify'

  " [13] Changes working directory
  Plug 'airblade/vim-rooter'

  " [14] Changes working directory
  " Plug 'tpope/vim-unimpaired'

  " [15] For Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " [16] For Ruby programming language
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'

  " [17] For Golang programming language
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Stable version of coc
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Plug 'honza/vim-snippets'
  " [18] Useful mappings
  Plug 'tpope/vim-unimpaired'

  " Helpers for UNIX
  " Plug 'tpope/vim-eunuch'
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
