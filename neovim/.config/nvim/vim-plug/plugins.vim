" Include all plugins"
call plug#begin('~/.vim/plugged')

  " Color scheme"
  Plug 'doums/darcula'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " The NERDTree is a file system explorer"
  Plug 'preservim/nerdtree'

  " Lint engine"
 Plug 'dense-analysis/ale'
call plug#end()

