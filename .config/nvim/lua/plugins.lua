vim.cmd('packadd packer.nvim')

-- local fn = vim.fn
-- local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({
--     'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
--     install_path
--   })
-- end

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "onsails/lspkind-nvim"
  use "glepnir/lspsaga.nvim"
  use "folke/trouble.nvim"
  use "liuchengxu/vista.vim"

  use { "xiyaowong/nvim-transparent" }

  -- LSP installer
  use "williamboman/nvim-lsp-installer"

  -- Autocomplete
  -- "hrsh7th/nvim-compe"
  use { 
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-cmdline"
    }
  }

  use "ray-x/lsp_signature.nvim"
  -- use"jiangmiao/auto-pairs"
  -- use "rstacruz/vim-closer"
  use 'windwp/nvim-autopairs'

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "windwp/nvim-ts-autotag"

  -- Move && Scroll && Replace
  use "wellle/targets.vim"
  use { "mg979/vim-visual-multi", branch = "master" }
  use "blackcauldron7/surround.nvim"
  use "AndrewRadev/splitjoin.vim"
  use "kevinhwang91/nvim-hlslens"
  use "karb94/neoscroll.nvim"
  use "phaazon/hop.nvim"
  use "chaoren/vim-wordmotion"

  -- Syntax
  use "folke/todo-comments.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "Yggdroot/indentLine"

  -- Git
  use "tpope/vim-fugitive"
  use "lewis6991/gitsigns.nvim"
  use "junegunn/gv.vim"
  -- use "sindrets/diffview.nvim"

  -- Icons
  use "kyazdani42/nvim-web-devicons"
  use "lambdalisue/glyph-palette.vim"

  -- Linter
  use "mhartington/formatter.nvim"

  -- Colorscheme
  -- use "sainnhe/gruvbox-material"
  use "WIttyJudge/gruvbox-material.nvim"

  -- Looking for files, etc..
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"

  -- Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Comment out code
  use "terrortylor/nvim-comment"

  -- Statusline and bufferline
  use "hoob3rt/lualine.nvim"

  -- Fancy startup screen
  use "mhinz/vim-startify"
  use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Changes working directory
  use "airblade/vim-rooter"

  -- Ruby
  use { "thoughtbot/vim-rspec", ft = 'ruby' }
  use { "tpope/vim-rvm", ft = 'ruby' }
  use { "tpope/vim-endwise", ft= 'ruby' }


  -- Golang
  use "ray-x/go.nvim"
  -- use { "fatih/vim-go", ft = 'go' }

  -- Useful functions
  use "lambdalisue/suda.vim"

  -- Undo history visualizer
  use "mbbill/undotree"

  -- Profiling
  use "tweekmonster/startuptime.vim"

  -- Autosave
  use "Pocco81/AutoSave.nvim"

  -- Run tests
  use "vim-test/vim-test"

  -- Improve startup time
  use "lewis6991/impatient.nvim"

  -- The interactive scratchpad.
  use "metakirby5/codi.vim"

  -- Debug
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  -- "theHamsta/nvim-dap-virtual-text";
  -- "Pocco81/DAPInstall.nvim";

  -- Full concentration on coding
  use "folke/zen-mode.nvim"

  -- Database
  use "tpope/vim-dadbod"
  use "kristijanhusak/vim-dadbod-ui"
end)
