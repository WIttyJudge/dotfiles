 " Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'

  " Looking for files
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " telescope requirements...
  " Plug 'nvim-lua/popup.nvim'
  " Plug 'nvim-lua/plenary.nvim'
  " Plug 'nvim-telescope/telescope.nvim'
  " Plug 'nvim-telescope/telescope-fzy-native.nvim'

  " Tree explorer
  " Plug 'preservim/nerdtree' |
  "       \ Plug 'jistr/vim-nerdtree-tabs' |
  "       \ Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'lambdalisue/fern.vim' |
        \ Plug 'lambdalisue/fern-git-status.vim' |
        \ Plug 'lambdalisue/nerdfont.vim' |
        \ Plug 'lambdalisue/fern-renderer-nerdfont.vim'

  Plug 'lambdalisue/glyph-palette.vim'

  " provides additional text objets
  Plug 'wellle/targets.vim'

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

  " Fancy startup screen
  Plug 'mhinz/vim-startify'

  " Changes working directory
  Plug 'airblade/vim-rooter'

  " For Git
  Plug 'mhinz/vim-signify'
  " Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'

  " Ruby
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'tpope/vim-endwise'
  " Plug 'tpope/vim-rails'

  " Golang
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Svetle
  Plug 'evanleck/vim-svelte'

  " Useful mappings
  Plug 'tpope/vim-unimpaired'

  " sudo
  Plug 'lambdalisue/suda.vim'
 
  " Undo history visualizer
  Plug 'mbbill/undotree'

  " Change an HTML opening tag and take the closing one along as well
  Plug 'AndrewRadev/tagalong.vim'

  " Profiling
  Plug 'tweekmonster/startuptime.vim'

  " LSP plugins
  Plug 'neovim/nvim-lspconfig' 
  Plug 'hrsh7th/nvim-compe'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'folke/trouble.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nathunsmitty/nvim-ale-diagnostic'
  Plug 'norcalli/nvim-colorizer.lua'
  " Snippets
  Plug 'hrsh7th/vim-vsnip'
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

