return {
  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- LSP stuff
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      require("plugins.configs.lspconfig")
    end,
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    build = ":MasonUpdate",
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    enabled = false,
    dependencies = {
      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        config = function()
          require("plugins.configs.nvim-autopairs")
        end,
      },

      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      require("plugins.configs.cmp")
    end,
  },

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

  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
      "moyiz/blink-emoji.nvim",
      "Kaiser-Yang/blink-cmp-dictionary",
      "mikavilpas/blink-ripgrep.nvim",
      { "L3MON4D3/LuaSnip", version = "v2.*" },
    },
    version = "*",
    config = function()
      require("plugins.configs.blink-nvim")
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    },
  },

  {
    "RRethy/vim-illuminate",
    event = "BufEnter",
    config = function()
      local config = {
        filetypes_denylist = {
          "dirvish",
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
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = true,
  },

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

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = true,
      },
      "HiPhish/rainbow-delimiters.nvim",
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
    "kevinhwang91/nvim-hlslens",
    opts = {
      calm_down = true,
      nearest_only = true,
      nearest_float_when = "always",
    },
    keys = require("core.mappings").nvim_hlslens,
  },

  {
    "LudoPinelli/comment-box.nvim",
    cmd = { "CBlcbox" },
  },

  {
    "phaazon/hop.nvim",
    config = true,
    keys = require("core.mappings").hop,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.configs.gitsigns")
    end,
  },

  -- Linter
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = require("core.mappings").conform,
    opts = {
      formatters_by_ft = {
        ruby = { "rubocop" },
        -- go = { "goimports", "gofumpt" },
        go = { "goimports" },
        -- rust = { "rustfmt" },
        lua = { "stylua" },
        sh = { "shfmt" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        sql = { "sqlfluff" },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
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
    "nvim-neo-tree/neo-tree.nvim",
    -- cmd = "Neotree",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = require("core.mappings").neo_tree,
    config = function()
      require("plugins.configs.neo-tree")
    end,
  },

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

  -- better diffing
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    keys = require("core.mappings").diffview,
    config = true,
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

  -- Markdown
  -- {
  -- 	"ellisonleao/glow.nvim",
  -- 	cmd = { "Glow" },
  -- 	config = true,
  -- },

  {
    "OXY2DEV/markview.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    config = true,
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

  --   {
  --   "zeioth/garbage-day.nvim",
  --   event = "VeryLazy",
  --   dependencies = "neovim/nvim-lspconfig",
  --   config = true
  -- },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    keys = require("core.mappings").todo_comments,
    config = true,
  },

  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    config = function()
      require("plugins.configs.trouble")
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = require("core.mappings").which_key,
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

  -- {
  --   "nvim-focus/focus.nvim",
  --   opts = {
  -- 		enabled = true,
  -- 		signcolumn = false,
  -- 	},
  -- },
}
