local present, packer = pcall(require, "packer")

-- Install packer  if it is not already installed.
if not present then
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  print "Cloning packer.."
  -- remove the dir before cloning
  fn.delete(packer_path, "rf")

  fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }

  vim.cmd "packadd packer.nvim"

  present, packer = pcall(require, "packer")

  if present then
    print "Packer cloned successfully."
  else
    error("Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer)
  end
end

local config = {
  auto_clean = true,
  compile_on_sync = true,
  git = { clone_timeout = 6000 },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "double" }
    end,
  },
}

packer.init(config)

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  -- LSP stuff
  use {
    "williamboman/mason.nvim",
    requires = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = require "plugins.configs.mason",
  }
  use {
    "neovim/nvim-lspconfig",
    config = require "lsp",
  }
  use "onsails/lspkind-nvim"
  use {
    "glepnir/lspsaga.nvim",
    config = require "plugins.configs.lspsaga",
  }
  use {
    "folke/trouble.nvim",
    config = require "plugins.configs.trouble",
  }
  -- use "liuchengxu/vista.vim"
  use {
    "j-hui/fidget.nvim",
    config = require "plugins.configs.fidget",
  }
  use {
    "stevearc/aerial.nvim",
    config = require "plugins.configs.aerial",
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = require "plugins.configs.lsp_signature",
  }

  -- load luasnips + cmp related in insert mode onlynvim/plugins
  use {
    "rafamadriz/friendly-snippets",
    -- event = "InsertEnter"
  }

  use {
    "hrsh7th/nvim-cmp",
    -- after = "friendly-snippets",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-cmdline",
    },
    config = require "plugins.configs.cmp",
  }

  use {
    "L3MON4D3/LuaSnip",
    -- after = "nvim-cmp",
    config = require "plugins.configs.lua_snip",
  }

  use {
    "windwp/nvim-autopairs",
    config = require "plugins.configs.nvim-autopairs",
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = require "plugins.configs.nvim-treesitter",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "windwp/nvim-ts-autotag"

  -- Move && Scroll && Replace
  use "wellle/targets.vim"
  use {
    "mg979/vim-visual-multi",
    branch = "master",
  }
  use {
    "ur4ltz/surround.nvim",
    config = require "plugins.configs.surround",
  }
  use "AndrewRadev/splitjoin.vim"
  use {
    "kevinhwang91/nvim-hlslens",
    config = require "plugins.configs.nvim-hlslens",
  }
  use {
    "karb94/neoscroll.nvim",
    config = require "plugins.configs.neoscroll",
  }
  use {
    "phaazon/hop.nvim",
    config = require "plugins.configs.hop",
  }
  use {
    "chaoren/vim-wordmotion",
    config = require "plugins.configs.vim-wordmotion",
  }
  use {
    "andymass/vim-matchup",
    config = require "plugins.configs.vim-matchup",
  }

  -- Syntax
  use {
    "folke/todo-comments.nvim",
    config = require "plugins.configs.todo-comments",
  }
  use {
    "norcalli/nvim-colorizer.lua",
    config = require "plugins.configs.nvim-colorizer",
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = require "plugins.configs.indent-blankline-nvim",
  }

  -- Git
  use "tpope/vim-fugitive"
  use {
    "lewis6991/gitsigns.nvim",
    config = require "plugins.configs.gitsigns",
  }
  use "junegunn/gv.vim"
  -- use "sindrets/diffview.nvim"

  use {
    "kdheepak/lazygit.nvim",
    config = require "plugins.configs.lazygit",
  }

  -- Icons
  -- use "kyazdani42/nvim-web-devicons"
  -- use "lambdalisue/glyph-palette.vim"

  -- Improve startup time
  use "lewis6991/impatient.nvim"
  use "nathom/filetype.nvim"

  -- Linter
  use {
    "mhartington/formatter.nvim",
    config = require "plugins.configs.formatter",
  }

  -- Colorscheme
  -- use "sainnhe/gruvbox-material"
  use "WIttyJudge/gruvbox-material.nvim"

  -- Looking for files, etc..
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "LinArcX/telescope-command-palette.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
    },
    config = require "plugins.configs.telescope",
  }

  -- Explorer
  use {
    "kyazdani42/nvim-tree.lua",
    config = require "plugins.configs.nvim-tree",
  }

  -- Comment out code
  -- use {
  --   "terrortylor/nvim-comment",
  --   config = require("plugins.configs.nvim-comment")
  -- }

  use {
    "numToStr/Comment.nvim",
    config = require "plugins.configs.comment",
  }

  -- Find and replace
  use "nvim-pack/nvim-spectre"

  -- Statusline and bufferline
  use {
    "hoob3rt/lualine.nvim",
    config = require "plugins.configs.lualine",
  }
  use {
    "alvarosevilla95/luatab.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = require "plugins.configs.luatab",
  }
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = require "plugins.configs.nvim-gps",
  }

  -- Fancy startup screen
  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = require "plugins.configs.alpha-nvim",
  }

  -- Ruby
  -- use { "thoughtbot/vim-rspec", ft = 'ruby' }
  use { "tpope/vim-endwise", ft = "ruby" }

  -- Golang
  use {
    "ray-x/go.nvim",
    config = require "plugins.configs.go-nvim",
  }

  -- Markdown
  use "ellisonleao/glow.nvim"

  -- Useful functions
  use "lambdalisue/suda.vim"

  -- Sorting plugin
  use {
    "sQVe/sort.nvim",
    config = require "plugins.configs.sort",
  }

  -- Undo history visualizer
  use {
    "mbbill/undotree",
    config = require "plugins.configs.undotree",
  }

  -- Profiling
  use "tweekmonster/startuptime.vim"

  -- Autosave
  use {
    "Pocco81/AutoSave.nvim",
    config = require "plugins.configs.auto-save",
  }

  -- Good notifications
  use {
    "rcarriga/nvim-notify",
    config = require "plugins.configs.notify",
  }

  -- Escape from insert mode without delay when typing
  use {
    "max397574/better-escape.nvim",
    config = require "plugins.configs.better-escape",
  }

  use {
    "luukvbaal/stabilize.nvim",
    config = require "plugins.configs.stabilize",
  }

  use {
    "nacro90/numb.nvim",
    config = require "plugins.configs.numb",
  }

  -- Debug
  -- use {
  --   "mfussenegger/nvim-dap",
  --   config = require("plugins.configs.nvim-dap")
  -- }
  -- use {
  --   "rcarriga/nvim-dap-ui",
  --   config = require("plugins.configs.nvim-dap-ui")
  -- }
  -- "theHamsta/nvim-dap-virtual-text";
  -- "Pocco81/DAPInstall.nvim";

  use {
    "beauwilliams/focus.nvim",
    config = require "plugins.configs.focus",
  }

  -- Database
  use "tpope/vim-dadbod"
  use {
    "kristijanhusak/vim-dadbod-ui",
    config = require "plugins.configs.vim-dadbod-ui",
  }
  use "kristijanhusak/vim-dadbod-completion"
end)
