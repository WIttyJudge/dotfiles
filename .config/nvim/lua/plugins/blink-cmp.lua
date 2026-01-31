-- https://github.com/saghen/blink.cmp
-- https://cmp.saghen.dev/
return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    "moyiz/blink-emoji.nvim",
    "mikavilpas/blink-ripgrep.nvim",
    "xzbdmw/colorful-menu.nvim",
    -- { "L3MON4D3/LuaSnip", version = "v2.*" },
  },
  version = "*",
  opts = {
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
      -- , "ripgrep"
      default = { "lsp", "path", "snippets", "buffer", "dadbod", "emoji" },
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
        -- ripgrep = {
        --   module = "blink-ripgrep",
        --   name = "Ripgrep",
        -- },
        -- hide snippets after trigger character
        snippets = {
          should_show_items = function(ctx)
            return ctx.trigger.initial_kind ~= "trigger_character"
          end,
        },
      },
    },

    -- snippets = {
    --   preset = "luasnip",
    -- },

    cmdline = {
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
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = false,
      },
    },

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
