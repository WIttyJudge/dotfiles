-- https://github.com/saghen/blink.cmp
-- https://cmp.saghen.dev/

return {
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
  config = {
    -- enabled = function()
    --   local filetype = vim.bo[0].filetype
    --   if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
    --     return false
    --   end
    --   return true
    -- end,

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer", "dadbod", "emoji", "dictionary", "ripgrep" },
      providers = {
        buffer = {
          opts = {
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ""
              end, vim.api.nvim_list_bufs())
            end,
          },
        },
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink",
        },
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          should_show_items = function()
            return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
          end,
        },
        dictionary = {
          module = "blink-cmp-dictionary",
          name = "Dict",
          min_keyword_length = 3,
          opts = {
            dictionary_files = {
              vim.fn.expand("../../../spell/en.utf-8.add"),
            },
          },
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
        },
      },
    },

    snippets = {
      preset = "luasnip",
    },

    cmdline = {
      keymap = { preset = "inherit" },
      completion = { menu = { auto_show = true } },
    },

    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = true,
      },
    },

    -- fuzzy = {
    --   implementation = 'lua',
    -- },

    signature = {
      enabled = true,
    },

    keymap = {
      preset = "super-tab",
      ["<C-y>"] = { "select_and_accept" },

      ["<S-k>"] = { "scroll_documentation_up", "fallback" },
      ["<S-j>"] = { "scroll_documentation_down", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    },
  },
}
