local present, packer = pcall(require, 'packer')
-- Install packer  if it is not already installed.
if not present then
  local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  print('Cloning packer..')
  -- remove the dir before cloning
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system({
    'git',
    'clone',
    '--depth',
    '20',
    'https://github.com/wbthomason/packer.nvim',
    packer_path,
  })

  vim.cmd('packadd packer.nvim')

  present, packer = pcall(require, 'packer')
  if present then
    print('Packer cloned successfully.')
  else
    error("Couldn't clone packer !\nPacker path: " .. packer_path .. '\n' .. packer)
  end
end

require('packer').startup(function()
  use "wbthomason/packer.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "onsails/lspkind-nvim"
  use "glepnir/lspsaga.nvim"
  use "folke/trouble.nvim"
  use "liuchengxu/vista.vim"
  use "ray-x/lsp_signature.nvim"

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
      "hrsh7th/cmp-cmdline",
      -- "hrsh7th/cmp-nvim-lsp-signature-help"
    }
  }

  use { "xiyaowong/nvim-transparent" }

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
  use "andymass/vim-matchup"

  -- Syntax
  use "folke/todo-comments.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "lukas-reineke/indent-blankline.nvim"

  -- Git
  use "tpope/vim-fugitive"
  use "lewis6991/gitsigns.nvim"
  use "junegunn/gv.vim"
  -- use "sindrets/diffview.nvim"

  -- Icons
  use "kyazdani42/nvim-web-devicons"
  use "lambdalisue/glyph-palette.vim"

  -- Improve startup time
  use "lewis6991/impatient.nvim"
  use "nathom/filetype.nvim"

  -- Linter
  use "mhartington/formatter.nvim"

  -- Colorscheme
  -- use "sainnhe/gruvbox-material"
  use "WIttyJudge/gruvbox-material.nvim"

  -- Looking for files, etc..
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      "LinArcX/telescope-command-palette.nvim",
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    }
  }

  -- Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Comment out code
  use "terrortylor/nvim-comment"

  -- Find and replace
  use "nvim-pack/nvim-spectre"

  -- Statusline and bufferline
  use "hoob3rt/lualine.nvim"
  use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }

  -- Fancy startup screen
  -- use "mhinz/vim-startify"
  -- use {
  --     'goolord/alpha-nvim',
  --     requires = { 'kyazdani42/nvim-web-devicons' }
  -- }
  use 'glepnir/dashboard-nvim'

  -- Ruby
  use { "thoughtbot/vim-rspec", ft = 'ruby' }
  use { "tpope/vim-rvm", ft = 'ruby' }
  use { "tpope/vim-endwise", ft= 'ruby' }

  -- Golang
  use "ray-x/go.nvim"
  -- use { "fatih/vim-go" }

  -- Markdown
  use 'ellisonleao/glow.nvim'

  -- Useful functions
  use "lambdalisue/suda.vim"

  -- Undo history visualizer
  use "mbbill/undotree"

  -- Profiling
  use "tweekmonster/startuptime.vim"

  -- Autosave
  use "Pocco81/AutoSave.nvim"
  
  -- Good notifications
  use "rcarriga/nvim-notify"

  -- Escape from insert mode without delay when typing
  use {
    "max397574/better-escape.nvim"
  }

  -- Run tests
  use "vim-test/vim-test"

  use "luukvbaal/stabilize.nvim"
  use "nacro90/numb.nvim"

  -- The interactive scratchpad.
  use "metakirby5/codi.vim"

  -- Debug
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  -- "theHamsta/nvim-dap-virtual-text";
  -- "Pocco81/DAPInstall.nvim";

  -- Full concentration on coding
  -- use "Pocco81/TrueZen.nvim"
  use 'beauwilliams/focus.nvim'

  -- Database
  use "tpope/vim-dadbod"
  use "kristijanhusak/vim-dadbod-ui"
  use "kristijanhusak/vim-dadbod-completion"
end)
