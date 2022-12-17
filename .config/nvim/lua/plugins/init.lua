local present, packer = pcall(require, "packer")

-- Install packer  if it is not already installed.
if not present then
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  print "Cloning packer.."

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
    error("Couldn't clone packer !\nPacker path: " .. install_path .. "\n" .. packer)
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
    config = function()
      require "plugins.configs.mason"
    end,
  }
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "lsp"
    end,
  }
  use "onsails/lspkind-nvim"
  use {
    "glepnir/lspsaga.nvim",
    config = function()
      require "plugins.configs.lspsaga"
    end,
  }
  use {
    "folke/trouble.nvim",
    config = function()
      require "plugins.configs.trouble"
    end,
  }
  use {
    "RRethy/vim-illuminate",
    config = function()
      require "plugins.configs.vim-illuminate"
    end,
  }
  use {
    "j-hui/fidget.nvim",
    config = function()
      require "plugins.configs.fidget"
    end,
  }

  -- load luasnips + cmp related in insert mode onlynvim/plugins
  use {
    "rafamadriz/friendly-snippets"
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
    config = function()
      require "plugins.configs.cmp"
    end,
  }

  use {
    "Darazaki/indent-o-matic",
    config = function()
      require "plugins.configs.indent-o-matic"
    end,
  }

  use {
    "L3MON4D3/LuaSnip",
    -- after = "nvim-cmp",
    config = function()
      require "plugins.configs.lua_snip"
    end,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require "plugins.configs.nvim-autopairs"
    end,
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require "plugins.configs.nvim-treesitter"
    end,
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
    config = function()
      require "plugins.configs.surround"
    end,
  }

  use {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require "plugins.configs.nvim-hlslens"
    end,
    commit = "e820ce69905f382e01d6e37d1a5be7529a466544",
  }

  -- use {
  --   "karb94/neoscroll.nvim",
  --   config = function() require "plugins.configs.neoscroll",
  -- }

  use {
    "phaazon/hop.nvim",
    config = function()
      require "plugins.configs.hop"
    end,
  }

  use {
    "chaoren/vim-wordmotion",
    config = function()
      require "plugins.configs.vim-wordmotion"
    end,
  }

  use {
    "andymass/vim-matchup",
    config = function()
      require "plugins.configs.vim-matchup"
    end,
  }

  -- Syntax
  use {
    "folke/todo-comments.nvim",
    config = function()
      require "plugins.configs.todo-comments"
    end,
  }
  use {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "plugins.configs.nvim-colorizer"
    end,
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.configs.indent-blankline-nvim"
    end,
  }

  -- Git
  use "tpope/vim-fugitive"
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.configs.gitsigns"
    end,
  }
  use "junegunn/gv.vim"

  -- Improve startup time
  use "lewis6991/impatient.nvim"
  use "nathom/filetype.nvim"

  -- Linter
  use {
    "mhartington/formatter.nvim",
    config = function()
      require "plugins.configs.formatter"
    end,
  }

  -- Colorscheme
  use "sainnhe/gruvbox-material"
  -- use "WIttyJudge/gruvbox-material.nvim"

  -- Looking for files, etc..
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "LinArcX/telescope-command-palette.nvim",
      "princejoogie/dir-telescope.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
    },
    config = function()
      require "plugins.configs.telescope"
    end,
  }

  -- Explorer
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "plugins.configs.nvim-tree"
    end,
  }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require "plugins.configs.comment"
    end,
  }

  -- Find and replace
  use "nvim-pack/nvim-spectre"

  -- Statusline and bufferline
  use {
    "hoob3rt/lualine.nvim",
    config = function()
      require "plugins.configs.lualine"
    end,
  }
  use {
    "alvarosevilla95/luatab.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require "plugins.configs.luatab"
    end,
  }
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.configs.nvim-gps"
    end,
  }

  -- Fancy startup screen
  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require "plugins.configs.alpha-nvim"
    end,
  }

  -- Golang
  use {
    "ray-x/go.nvim",
    config = function()
      require "plugins.configs.go-nvim"
    end,
  }
  -- Used by go.nvim plugin, it supports floating windows.
  use { "ray-x/guihua.lua" }

  -- Markdown
  use {
    "ellisonleao/glow.nvim",
    ft = "md",
  }

  use {
    "Wansmer/treesj",
    requires = { "nvim-treesitter" },
    config = function()
      require "plugins.configs.treesj"
    end,
  }

  -- Useful functions
  use "lambdalisue/suda.vim"

  -- Sorting plugin
  use {
    "sQVe/sort.nvim",
    config = function()
      require "plugins.configs.sort"
    end,
  }

  -- Undo history visualizer
  use {
    "mbbill/undotree",
    config = function()
      require "plugins.configs.undotree"
    end,
  }

  -- Profiling
  use "tweekmonster/startuptime.vim"

  -- Good notifications
  use {
    "rcarriga/nvim-notify",
    config = function()
      require "plugins.configs.notify"
    end,
  }

  -- Escape from insert mode without delay when typing
  use {
    "max397574/better-escape.nvim",
    config = function()
      require "plugins.configs.better-escape"
    end,
  }

  use {
    "luukvbaal/stabilize.nvim",
    config = function()
      require "plugins.configs.stabilize"
    end,
  }

  use {
    "nacro90/numb.nvim",
    config = function()
      require "plugins.configs.numb"
    end,
  }

  use {
    "stevearc/dressing.nvim",
    config = function()
      require "plugins.configs.dressing"
    end,
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require "plugins.configs.whichkey"
    end,
  }

  -- use {
  --   "Pocco81/auto-save.nvim",
  --   config = function() require "plugins.configs.auto-save",
  -- }

  -- Debug
  -- use {
  --   "mfussenegger/nvim-dap",
  --   config = function() require("plugins.configs.nvim-dap") end,
  -- }
  -- use {
  --   "rcarriga/nvim-dap-ui",
  --   config = function() require("plugins.configs.nvim-dap-ui") end,
  -- }
  -- "theHamsta/nvim-dap-virtual-text";
  -- "Pocco81/DAPInstall.nvim";

  use {
    "beauwilliams/focus.nvim",
    config = function()
      require "plugins.configs.focus"
    end,
  }

  -- Database
  use "tpope/vim-dadbod"
  use {
    "kristijanhusak/vim-dadbod-ui",
    config = function()
      require "plugins.configs.vim-dadbod-ui"
    end,
  }
  use "kristijanhusak/vim-dadbod-completion"
end)
