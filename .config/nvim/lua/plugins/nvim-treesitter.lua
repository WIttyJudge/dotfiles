-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      config = true,
    },
    "HiPhish/rainbow-delimiters.nvim",
  },
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  opts = {
    auto_install = false,

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = "<S-CR>",
        node_decremental = "<BS>",
      },
    },

    -- +---------------------------------------------------------+
    -- |                         PLUGINS                         |
    -- +---------------------------------------------------------+

    -- nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)

        -- Enable treesitter-based indentation
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        local ensure_installed = {
          "query",
          "bash",
          "html",
          "http",
          "css",
          "go",
          "gomod",
          "gowork",
          "gosum",
          "ruby",
          "graphql",
          "java",
          "json",
          "php",
          "python",
          "rust",
          "typescript",
          "yaml",
          "regex",
          "javascript",
          "lua",
          "toml",
          "dockerfile",
          "vim",
          "sql",
        }
        local already_installed = require("nvim-treesitter.config").get_installed()
        local parsers_to_install = vim
          .iter(ensure_installed)
          :filter(function(parser)
            return not vim.tbl_contains(already_installed, parser)
          end)
          :totable()
        require("nvim-treesitter").install(parsers_to_install)
      end,
    })
  end,
}
