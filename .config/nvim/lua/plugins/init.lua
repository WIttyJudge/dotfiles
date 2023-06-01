return {
  -- LSP stuff
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("plugins.configs.mason")
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    event = "BufRead",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  },

  {
    "onsails/lspkind-nvim",
  },

  {
    "RRethy/vim-illuminate",
    event = "BufEnter",
    config = function()
      local config = {
        filetypes_denylist = {
          "dirvish",
          "alpha",
          "fugitive",
          "NvimTree",
          "TelescopePrompt",
        },

        -- set highest priority for treesitter, and disable regex search
        providers = { "treesitter", "lsp" },
      }

      require("illuminate").configure(config)
    end,
  },

  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "j-hui/fidget.nvim",
    opts = {
      window = {
        -- adjust transparency.
        blend = 0,
      },
    },
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
      require("plugins.configs.cmp")
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("plugins.configs.lua_snip")
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "plugins.configs.nvim-autopairs"
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      "p00f/nvim-ts-rainbow",
      "nvim-treesitter/nvim-treesitter-refactor",
      "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      require("plugins.configs.nvim-treesitter")
    end,
  },

  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
  {
    "junegunn/gv.vim",
  },

  {
    "ur4ltz/surround.nvim",
    opts = { context_offset = 500 },
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("plugins.configs.nvim-hlslens")
    end,
    commit = "e820ce69905f382e01d6e37d1a5be7529a466544",
  },

  {
    "LudoPinelli/comment-box.nvim",
    event = "BufEnter",
  },

  {
    "karb94/neoscroll.nvim",
    config = true,
  },

  {
    "phaazon/hop.nvim",
    config = true,
  },

  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Syntax
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("plugins.configs.indent-blankline-nvim")
    end,
  },

  -- Automatic indentation
  {
    "nmac427/guess-indent.nvim",
    config = true,
  },

  -- Git
  { "tpope/vim-fugitive" },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.configs.gitsigns")
    end,
  },

  -- { "junegunn/gv.vim" },

  -- Linter
  {
    "mhartington/formatter.nvim",
    cmd = { "Format", "FormatWrite" },
    config = function()
      require("plugins.configs.formatter")
    end,
  },

  -- Colorscheme
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    name = "gruvbox-material",
  },

  -- { "catppuccin/nvim", name = "catppuccin" },

  -- { "WIttyJudge/gruvbox-material.nvim" }

  -- Looking for files, etc..
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "princejoogie/dir-telescope.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  },

  -- Explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = function()
      require("plugins.configs.nvim-tree")
    end,
  },

  {
    "numToStr/Comment.nvim",
    opts = { mappings = false },
  },

  -- Find and replace
  {
    "nvim-pack/nvim-spectre",
    cmd = { "SpectreOpen" },
  },

  -- Statusline and bufferline
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.configs.lualine")
    end,
  },

  {
    "alvarosevilla95/luatab.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      modified = function() return "" end,
    }
  },

  {
    "SmiteshP/nvim-navic",
    opts = { separator = " ", highlight = true, depth_limit = 7 },
  },

  -- Fancy startup screen
  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.configs.alpha-nvim")
    end,
  },

  -- Golang

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  -- Markdown
  {
    "ellisonleao/glow.nvim",
    ft = "markdown",
    config = true,
  },

  {
    "Wansmer/treesj",
    cmd = { "TSJSplit", "TSJJoin" },
    dependencies = { "nvim-treesitter" },
    init = function()
      vim.keymap.set("n", "gS", ":TSJSplit<CR>", { silent = true })
      vim.keymap.set("n", "gJ", ":TSJJoin<CR>", { silent = true })
    end,
    opts = {
      use_default_keymaps = false,
    },
  },

  -- Useful functions
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaEdit", "SudaWrite" },
  },

  -- Sorting plugin
  {
    "sQVe/sort.nvim",
    cmd = { "Sort" },
  },

  -- Good notifications
  {
    "rcarriga/nvim-notify",
    opts = {
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      timeout = 3000,
    },
  },

  -- Escape from insert mode without delay when typing
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk", "kj" },
    },
  },

  {
    "nacro90/numb.nvim",
    config = true,
  },

  -- {
  --   "stevearc/dressing.nvim",
  --   enabled = false,
  --   event = "VeryLazy",
  --   otps = {
  --     input = {
  --       default_prompt = "➤ ",
  --       win_options = {
  --         winhighlight = "Normal:Normal,NormalNC:Normal",
  --       },
  --     },
  --     select = {
  --       backend = { "telescope", "builtin" },
  --       builtin = { win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" } },
  --     },
  --   }
  -- },

  -- I LOVE YOU FOLKE
  {
    "folke/todo-comments.nvim",
    opts = { signs = false },
  },

  {
    "folke/trouble.nvim",
    config = function()
      require("plugins.configs.trouble")
    end,
  },

  {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`" },
    config = function()
      require("plugins.configs.whichkey")
    end,
  },

  -- {
  --   "Pocco81/auto-save.nvim",
  --   opts = {
  --     execution_message = {
  --       message = function() return ("") end,
  --     },
  --   }
  -- },

  -- Debug
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "theHamsta/nvim-dap-virtual-text" },
    },
    config = function()
      require "plugins.configs.nvim-dap"
    end,
  },

  -- {
  --   "rcarriga/nvim-dap-ui",
  --   config = function() require("plugins.configs.nvim-dap-ui") end,
  -- }
  -- "Pocco81/DAPInstall.nvim";

  -- {
  --   "beauwilliams/focus.nvim",
  --   opts = { enabled = true, signcolumn = false },
  -- },

  {
    "beauwilliams/focus.nvim",
    opts = { enabled = true, signcolumn = false },
  },

  -- Database

  {
    "tpope/vim-dadbod",
    event = "VeryLazy",
    dependencies = {
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
      { "kristijanhusak/vim-dadbod-ui", cmd = { "DBUI", "DBUIFindBuffer" } },
    },
    init = function()
      require("plugins.configs.vim-dadbod-ui")
    end,
  },
}
