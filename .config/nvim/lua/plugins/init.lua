return {
  -- LSP stuff
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      require("lsp.handlers").setup()
    end,
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      require("plugins.configs.mason")
    end,
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

  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
      "moyiz/blink-emoji.nvim",
      "Kaiser-Yang/blink-cmp-dictionary",
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    version = "*",
    config = function ()
      require("plugins.configs.blink-nvim")
    end,
    opts_extend = {
      "sources.completion.enabled_providers",
      "sources.default",
    },
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
    config = true,
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

  -- {
  -- 	"zeioth/garbage-day.nvim",
  -- 	dependencies = "neovim/nvim-lspconfig",
  -- 	event = "VeryLazy",
  -- 	opts = { }
  -- },

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
    main = "ibl",
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
    opts = {
      formatters_by_ft = {
        ruby = { "rubocop" },
        go = { "goimports", "gofumpt" },
        -- rust = { "rustfmt" },
        lua = { "stylua" },
        sh = { "shfmt" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
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
      integrations = {
        aerial = true,
        diffview = true,
        blink_cmp = true,
        dadbod_ui = true,
      },
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
      { "danielfalk/smart-open.nvim", dependencies = { "kkharji/sqlite.lua" } },
    },
    keys = require("core.mappings").telescope,
    cmd = { "Telescope" },
    config = function()
      require("plugins.configs.telescope_nvim")
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
    keys = require("core.mappings").neo_tree,
    config = function()
      require("plugins.configs.neo-tree")
    end,
  },

  {
    "stevearc/oil.nvim",
    enabled = true,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    keys = require("core.mappings").oil,
    config = function()
      require("plugins.configs.oil-nvim")
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
  -- {
  -- 	"nvim-pack/nvim-spectre",
  -- 	cmd = { "SpectreToggle", "SpectreCurrentWord", "SpectreCurrentFile" },
  -- },

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
      separator = " ",
      highlight = true,
      depth_limit = 7,
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

  -- Notes taking

  {
    "backdround/global-note.nvim",
    config = function()
      require("plugins.configs.global-note")
    end,
  },

  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = require("core.mappings").nvim_spider,
  },

  -- {
  -- 	"johmsalas/text-case.nvim",
  -- 	config = true,
  -- },

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
    config = true,
  },

  {
    "tzachar/highlight-undo.nvim",
    event = "BufEnter",
    config = true,
  },

  {
    "nacro90/numb.nvim",
    event = { "CmdlineEnter" },
    config = true,
  },

  -- I LOVE YOU FOLKE
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = false,
    },
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

  -- Database

  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = {
          "sql",
          "mysql",
          "plsql",
        },
      },
    },
    init = function()
      require("plugins.configs.vim-dadbod-ui")
    end,
  },
}
