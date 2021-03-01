" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
  " Color scheme
  " Plug 'doums/darcula'
  Plug 'morhetz/gruvbox'

  " Looking for files
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Tree explorer plugin
  Plug 'preservim/nerdtree'

  " Commenting
  Plug 'tpope/vim-commentary'

  " Lint engine
  Plug 'dense-analysis/ale'

  " Multiple select of text
  Plug 'terryma/vim-multiple-cursors'

  " To display the indention levels with thin vertical lines 
  Plug 'Yggdroot/indentLine'

  " To work with git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'

  " This is a lightweight RSpec runner for Vim
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

  Plug 'tpope/vim-rails'

  Plug 'tpope/vim-surround'

  " html emmet
  " Plug 'mattn/emmet-vim'

  " Add end work in ruby
  Plug 'tpope/vim-endwise' 

  " statusline/tabline plugin for Vim
  Plug 'itchyny/lightline.vim'

  Plug 'liuchengxu/vim-which-key'

  " For working with Golang programming language
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  Plug 'airblade/vim-rooter'
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
