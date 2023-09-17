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
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lsp")
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      {
        "hrsh7th/cmp-cmdline",
        event = { "CmdlineEnter" },
      },
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      require("plugins.configs.cmp")
    end,
  },

  -- Snippets
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
    "j-hui/fidget.nvim",
    tag = "legacy",
    opts = {
      window = {
        -- adjust transparency.
        blend = 0,
      },
    },
  },

  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
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
      "nvim-treesitter/nvim-treesitter-textobjects",
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
    "ur4ltz/surround.nvim",
    opts = { context_offset = 500 },
  },

  {
    "kevinhwang91/nvim-hlslens",
    opts = {
      calm_down = true,
      nearest_only = true,
      nearest_float_when = "always",
    },
  },

  {
    "LudoPinelli/comment-box.nvim",
    event = "BufEnter",
  },

  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   config = true,
  -- },

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
    event = { "BufReadPost", "BufNewFile" },
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
  {
    "junegunn/gv.vim",
    cmd = { "GV" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.configs.gitsigns")
    end,
  },

  -- Linter
  {
    "mhartington/formatter.nvim",
    cmd = { "Format", "FormatWrite" },
    config = function()
      require("plugins.configs.formatter")
    end,
  },

  -- Colorschema

  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.gruvbox_material_better_performance = 1
  --     vim.g.gruvbox_material_enable_italic_comments = true
  --     vim.opt.background = "dark"
  --
  --     vim.cmd.colorscheme('gruvbox-material')
  --   end,
  -- },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
    },
    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },

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
    config = function()
      require("plugins.configs.neo-tree")
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = true
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
    opts = { separator = " ", highlight = true, depth_limit = 7 },
  },

  -- Fancy startup screen
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
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
    build = ':lua require("go.install").update_all_sync()',
  },

  -- Markdown
  {
    "ellisonleao/glow.nvim",
    cmd = { "Glow" },
    config = true,
  },

  {
    "Wansmer/treesj",
    cmd = { "TSJSplit", "TSJJoin" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
    },
  },

  -- Small and very helpful plugins
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },

  {
    "chrisgrieser/nvim-spider",
  },

  {
    "johmsalas/text-case.nvim",
    config = true,
  },

  {
    "LunarVim/bigfile.nvim",
    config = function()
      require("plugins.configs.bigfile")
    end,
  },

  {
    "sQVe/sort.nvim",
    cmd = { "Sort" },
  },

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
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = { signs = false },
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
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("plugins.configs.nvim-dap-ui")
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
          commented = true,
        },
      },
      {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = true,
      },
    },
  },

  -- {
  --   "nvim-focus/focus.nvim",
  --   opts = { enabled = true, signcolumn = false },
  -- },

  -- Database

  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI" },
    dependencies = {
      "tpope/vim-dadbod",
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
    },
    init = function()
      require("plugins.configs.vim-dadbod-ui")
    end,
  },
}
