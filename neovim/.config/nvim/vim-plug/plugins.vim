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

  " The NERDTree is a file system explorer
  Plug 'preservim/nerdtree'

  " Writes comments
  Plug 'tpope/vim-commentary'

  " Lint engine
  Plug 'dense-analysis/ale'

  " Multiple select of text
  Plug 'terryma/vim-multiple-cursors'

  " indentline
  Plug 'Yggdroot/indentLine'

  " To work with git
  Plug 'airblade/vim-gitgutter'

  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
call plug#end()

