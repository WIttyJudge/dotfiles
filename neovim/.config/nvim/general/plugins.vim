" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
  " Theme
  " Plug 'doums/darcula'
  Plug 'morhetz/gruvbox'

  " Looking for files
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Tree explorer
  Plug 'preservim/nerdtree' |
        \ Plug 'jistr/vim-nerdtree-tabs' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'

  " Comment out code
  Plug 'tpope/vim-commentary'

  " Linter
  Plug 'dense-analysis/ale'

  " Multiple select of text
  " Plug 'terryma/vim-multiple-cursors'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " Display vertical lines in code
  Plug 'Yggdroot/indentLine'

  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'

  " Simple quoting, parenthesizing
  Plug 'tpope/vim-surround'

  " Statusline, tabline
  Plug 'itchyny/lightline.vim'

  " Fancy startup screen for vim
  Plug 'mhinz/vim-startify'

  " Changes working directory
  Plug 'airblade/vim-rooter'

  " anges working directory
  " Plug 'tpope/vim-unimpaired'

  " For Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'

  " For Ruby programming language
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'

  " For Golang programming language
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Stable version of coc
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Plug 'honza/vim-snippets'

  Plug 'tpope/vim-unimpaired'

  " Plug 'dbeniamine/cheat.sh-vim'

  Plug 'mbbill/undotree'

  " Plug 'neovim/nvim-lspconfig'
  " Plug 'hrsh7th/nvim-compe'
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
