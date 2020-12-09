" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
  " Color scheme
  Plug 'doums/darcula'

  " Looking for files
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Tree explorer plugin
  Plug 'preservim/nerdtree'

  " Writes comments
  Plug 'tpope/vim-commentary'

  " Lint engine
  Plug 'dense-analysis/ale'

  " Multiple select of text
  Plug 'terryma/vim-multiple-cursors'

  " To display the indention levels with thin vertical lines 
  Plug 'Yggdroot/indentLine'

  " To work with git
  Plug 'airblade/vim-gitgutter'

  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'

  " This is a lightweight RSpec runner for Vim
  Plug 'thoughtbot/vim-rspec'

  Plug 'tpope/vim-surround'

  " html emmet
  Plug 'mattn/emmet-vim'

  Plug 'itchyny/lightline.vim'
call plug#end()

