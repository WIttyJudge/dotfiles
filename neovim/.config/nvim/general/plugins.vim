 " Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

  " LSP
  Plug 'neovim/nvim-lspconfig' 
  Plug 'onsails/lspkind-nvim'
  Plug 'kabouzeid/nvim-lspinstall'

  " Aucomplete
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-endwise'
  " html
  Plug 'gregsexton/MatchTag'
  Plug 'AndrewRadev/tagalong.vim'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'p00f/nvim-ts-rainbow'

  " Linter
  Plug 'dense-analysis/ale'
  Plug 'nathunsmitty/nvim-ale-diagnostic'

  " Colors
  Plug 'norcalli/nvim-colorizer.lua'

  " Colorscheme
  " Plug 'morhetz/gruvbox'
  Plug 'sainnhe/gruvbox-material'

  " Syntax
  Plug 'evanleck/vim-svelte'
  Plug 'Yggdroot/indentLine'

  " Looking for files
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Icons
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'lambdalisue/glyph-palette.vim'

  " telescope requirements...
  " Plug 'nvim-lua/popup.nvim'
  " Plug 'nvim-lua/plenary.nvim'
  " Plug 'nvim-telescope/telescope.nvim'
  " Plug 'nvim-telescope/telescope-fzy-native.nvim'

  " Explorer
  " Plug 'lambdalisue/fern.vim' |
  "       \ Plug 'lambdalisue/fern-git-status.vim' |
  "       \ Plug 'lambdalisue/nerdfont.vim' |
  "       \ Plug 'lambdalisue/fern-renderer-nerdfont.vim'

  Plug 'kyazdani42/nvim-tree.lua'

  " Move && Scroll && Replace
  Plug 'wellle/targets.vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'kevinhwang91/nvim-hlslens'
  Plug 'karb94/neoscroll.nvim'

  " Comment out code
  Plug 'tpope/vim-commentary'

  " Statusline and bufferline
  " Plug 'itchyny/lightline.vim'
  Plug 'famiu/feline.nvim'
  " Plug 'romgrk/barbar.nvim'
  " Plug 'akinsho/nvim-bufferline.lua'

  " Fancy startup screen
  Plug 'mhinz/vim-startify'

  " Changes working directory
  Plug 'airblade/vim-rooter'

  " Git
  Plug 'mhinz/vim-signify'
  " Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'

  " Ruby
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  " Plug 'tpope/vim-rails'

  " Useful functions
  Plug 'lambdalisue/suda.vim'
 
  " Undo history visualizer
  Plug 'mbbill/undotree'

  " Profiling
  Plug 'tweekmonster/startuptime.vim'

  Plug 'tpope/vim-dispatch'
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

