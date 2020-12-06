" Install vim-plug if not found"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

  " Multiple select of text"
  Plug 'terryma/vim-multiple-cursors'
call plug#end()

