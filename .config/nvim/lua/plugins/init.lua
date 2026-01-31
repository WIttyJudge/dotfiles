return {
  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
  },

  -- Snippets
  -- {
  --   "L3MON4D3/LuaSnip",
  --   dependencies = {
  --     {
  --       "rafamadriz/friendly-snippets",
  --       config = function()
  --         require("luasnip.loaders.from_vscode").lazy_load()
  --       end,
  --     },
  --   },
  --   opts = {
  --     history = true,
  --     updateevents = "TextChanged,TextChangedI",
  --   },
  -- },

  -- {
  --   "j-hui/fidget.nvim",
  --   event = "LspAttach",
  --   config = true,
  -- },

  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = require("core.mappings").aerial,
    opts = {
      attach_mode = "global",
      layout = {
        win_opts = {
          winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
          signcolumn = "yes",
          statuscolumn = " ",
        },
      },
    },
  },

  {
    "mg979/vim-visual-multi",
    branch = "master",
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },

  -- HTTP REST-Client Interface
  {
    "mistweaverco/kulala.nvim",
    config = true,
    keys = require("core.mappings").kulala,
  },

  {
    "LudoPinelli/comment-box.nvim",
    cmd = { "CBlcbox" },
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.configs.gitsigns")
    end,
  },

  -- Looking for files, etc..
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "princejoogie/dir-telescope.nvim",
  --     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  --     { "danielfalk/smart-open.nvim", dependencies = { "kkharji/sqlite.lua" } },
  --   },
  --   keys = require("core.mappings").telescope,
  --   cmd = { "Telescope" },
  --   config = function()
  --     require("plugins.configs.telescope_nvim")
  --   end,
  -- },

  -- Explorer
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  --   config = function()
  --     require("plugins.configs.nvim-tree")
  --   end,
  -- },

  {
    "numToStr/Comment.nvim",
    opts = {
      mappings = false,
    },
    keys = require("core.mappings").comment_nvim,
  },

  -- Find and replace
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = require("core.mappings").grub_fat,
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
      modified = function()
        return ""
      end,
    },
  },

  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = {
      highlight = true,
      depth_limit = 7,
      lazy_update_context = true,
    },
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
    keys = require("core.mappings").go_nvim,
    build = ':lua require("go.install").update_all_sync()',
  },

  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "TSJSplit", "TSJJoin" },
    keys = require("core.mappings").treesj,
    opts = {
      use_default_keymaps = false,
    },
  },

  {
    "nguyenvukhang/nvim-toggler",
    opts = {
      remove_default_keybinds = false,
      remove_default_inverses = false,
      inverses = {
        ["true"] = "false",
        ["!="] = "==",
      },
    },
    keys = require("core.mappings").toggler,
  },

  -- {
  --   "LunarVim/bigfile.nvim",
  --   config = function()
  --     require("plugins.configs.bigfile")
  --   end,
  -- },

  -- {
  --   "zeioth/garbage-day.nvim",
  --   event = "VeryLazy",
  --   dependencies = "neovim/nvim-lspconfig",
  --   config = true
  -- },

  {
    "folke/todo-comments.nvim",
    event = "BufReadPre", -- needed to highlight keywords
    keys = require("core.mappings").todo_comments,
    config = true,
  },

  -- {
  --   "nvim-focus/focus.nvim",
  --   opts = {
  -- 		enabled = true,
  -- 		signcolumn = false,
  -- 	},
  -- },
}
