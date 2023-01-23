return {
  -- LSP stuff
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "plugins.configs.mason"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "lsp"
    end,
  },
  "onsails/lspkind-nvim",
  {
    "folke/trouble.nvim",
    config = function()
      require "plugins.configs.trouble"
    end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require "plugins.configs.vim-illuminate"
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require "plugins.configs.fidget"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      require "plugins.configs.cmp"
    end,
  },

  {
    "Darazaki/indent-o-matic",
    config = function()
      require "plugins.configs.indent-o-matic"
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require "plugins.configs.lua_snip"
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require "plugins.configs.nvim-autopairs"
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.configs.nvim-treesitter"
    end,
  },
  "p00f/nvim-ts-rainbow",
  "nvim-treesitter/nvim-treesitter-refactor",
  "windwp/nvim-ts-autotag",

  -- Move && Scroll && Replace
  "wellle/targets.vim",
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
  {
    "ur4ltz/surround.nvim",
    config = function()
      require "plugins.configs.surround"
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require "plugins.configs.nvim-hlslens"
    end,
    commit = "e820ce69905f382e01d6e37d1a5be7529a466544",
  },

  -- {
  --   "karb94/neoscroll.nvim",
  --   config = function() require "plugins.configs.neoscroll",
  -- }

  {
    "phaazon/hop.nvim",
    config = function()
      require "plugins.configs.hop"
    end,
  },

  {
    "chaoren/vim-wordmotion",
    config = function()
      require "plugins.configs.vim-wordmotion"
    end,
  },

  {
    "andymass/vim-matchup",
    config = function()
      require "plugins.configs.vim-matchup"
    end,
  },

  -- Syntax
  {
    "folke/todo-comments.nvim",
    config = function()
      require "plugins.configs.todo-comments"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "plugins.configs.nvim-colorizer"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.configs.indent-blankline-nvim"
    end,
  },

  -- Git
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.configs.gitsigns"
    end,
  },
  "junegunn/gv.vim",

  -- Linter
  {
    "mhartington/formatter.nvim",
    config = function()
      require "plugins.configs.formatter"
    end,
  },

  -- Colorscheme
  "sainnhe/gruvbox-material",
  -- "WIttyJudge/gruvbox-material.nvim"
  --
  -- -- Looking for files, etc..
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "LinArcX/telescope-command-palette.nvim",
      "princejoogie/dir-telescope.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require "plugins.configs.telescope"
    end,
  },
  --
  -- -- Explorer
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "plugins.configs.nvim-tree"
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require "plugins.configs.comment"
    end,
  },

  -- Find and replace
  "nvim-pack/nvim-spectre",

  -- Statusline and bufferline
  {
    "hoob3rt/lualine.nvim",
    config = function()
      require "plugins.configs.lualine"
    end,
  },
  {
    "alvarosevilla95/luatab.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require "plugins.configs.luatab"
    end,
  },
  {
    "SmiteshP/nvim-gps",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.configs.nvim-gps"
    end,
  },

  -- -- Fancy startup screen
  {
    "goolord/alpha-nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require "plugins.configs.alpha-nvim"
    end,
  },
  --
  -- -- Golang
  {
    "ray-x/go.nvim",
    config = function()
      require "plugins.configs.go-nvim"
    end,
  },
  -- Used by go.nvim plugin, it supports floating windows.
  "ray-x/guihua.lua",

  -- Markdown
  {
    "ellisonleao/glow.nvim",
    ft = "markdown",
  },

  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter" },
    config = function()
      require "plugins.configs.treesj"
    end,
  },

  -- Useful functions
  "lambdalisue/suda.vim",

  -- Sorting plugin
  {
    "sQVe/sort.nvim",
    event = 'BufEnter',
    config = function()
      require "plugins.configs.sort"
    end,
  },

  -- Undo history visualizer
  {
    "mbbill/undotree",
    config = function()
      require "plugins.configs.undotree"
    end,
  },

  -- Good notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      require "plugins.configs.notify"
    end,
  },

  -- Escape from insert mode without delay when typing
  {
    "max397574/better-escape.nvim",
    config = function()
      require "plugins.configs.better-escape"
    end,
  },

  {
    "nacro90/numb.nvim",
    config = function()
      require "plugins.configs.numb"
    end,
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require "plugins.configs.dressing"
    end,
  },

  {
    "folke/which-key.nvim",
    config = function()
      require "plugins.configs.whichkey"
    end,
  },

  -- {
  --   "Pocco81/auto-save.nvim",
  --   config = function() require "plugins.configs.auto-save",
  -- }

  -- Debug
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function() require("plugins.configs.nvim-dap") end,
  -- }
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   config = function() require("plugins.configs.nvim-dap-ui") end,
  -- }
  -- "theHamsta/nvim-dap-virtual-text";
  -- "Pocco81/DAPInstall.nvim";

  {
    "beauwilliams/focus.nvim",
    config = function()
      require "plugins.configs.focus"
    end,
  },

  -- Database
  "tpope/vim-dadbod",
  {
    "kristijanhusak/vim-dadbod-ui",
    config = function()
      require "plugins.configs.vim-dadbod-ui"
    end,
  },
  "kristijanhusak/vim-dadbod-completion"
}
