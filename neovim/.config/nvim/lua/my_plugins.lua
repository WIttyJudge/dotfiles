local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig' 
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'
  -- use 'kabouzeid/nvim-lspinstall'
  -- use 'seblj/nvim-echo-diagnostics'

  -- Aucomplete
  use 'hrsh7th/nvim-compe'
  use 'ray-x/lsp_signature.nvim'
  use 'hrsh7th/vim-vsnip'
  use 'tpope/vim-endwise'
  -- use 'jiangmiao/auto-pairs'
  -- html
  use 'gregsexton/MatchTag'
  use 'AndrewRadev/tagalong.vim'

  -- use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'ray-x/go.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'
  -- Linter
  -- use 'dense-analysis/ale'
  -- use 'nathunsmitty/nvim-ale-diagnostic'

  -- Colors
  use 'norcalli/nvim-colorizer.lua'


  -- Colorscheme
  use 'sainnhe/gruvbox-material'

  -- Syntax
  -- use 'evanleck/vim-svelte'
  use 'Yggdroot/indentLine'
  -- use 'lukas-reineke/indent-blankline.nvim'

  -- Looking for files
  use { 'junegunn/fzf', run = 'fzf#install()' }
  use 'junegunn/fzf.vim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'lambdalisue/glyph-palette.vim'

  -- telescope requirements...
  -- use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  -- use 'nvim-telescope/telescope.nvim'
  -- use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Explorer
  -- use 'lambdalisue/fern.vim' |
  --       \ use 'lambdalisue/fern-git-status.vim' |
  --       \ use 'lambdalisue/nerdfont.vim' |
  --       \ use 'lambdalisue/fern-renderer-nerdfont.vim'

  use 'kyazdani42/nvim-tree.lua'

  -- Move && Scroll && Replace
  use 'wellle/targets.vim'
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use 'tpope/vim-surround'
  use 'blackcauldron7/surround.nvim'
  use 'tpope/vim-unimpaired'
  use 'kevinhwang91/nvim-hlslens'
  use 'karb94/neoscroll.nvim'

  -- Comment out code
  -- use 'tpope/vim-commentary'
  use 'terrortylor/nvim-comment'

  -- Statusline and bufferline
  use 'hoob3rt/lualine.nvim'
  -- use 'crispgm/nvim-tabline'

  -- Fancy startup screen
  use 'mhinz/vim-startify'

  -- Changes working directory
  use 'airblade/vim-rooter'

  -- Git
  use 'tpope/vim-fugitive'
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'junegunn/gv.vim'
  -- use 'sindrets/diffview.nvim'

  -- Ruby
  use { 'thoughtbot/vim-rspec', ft = 'ruby' }
  use 'tpope/vim-rails'

  -- Useful functions
  use 'lambdalisue/suda.vim'
 
  -- Undo history visualizer
  use 'mbbill/undotree'

  -- Profiling
  use 'tweekmonster/startuptime.vim'

  use 'tpope/vim-rvm'

  use 'AndrewRadev/splitjoin.vim'

  use 'folke/todo-comments.nvim'

  use 'mhartington/formatter.nvim'

  -- Database
  -- use 'tpope/vim-dadbod'
end)
