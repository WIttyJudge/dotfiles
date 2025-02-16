-- https://github.com/saghen/blink.cmp
-- Documentation site: https://cmp.saghen.dev/

local blink = require("blink.cmp")

local config = {
  enabled = function()
    local filetype = vim.bo[0].filetype
    if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
      return false
    end
    return true
  end,

  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },

  sources = {
    -- maybe I'll add copilet later
    default = { "lsp", "path", "snippets", "buffer", "dadbod", "emoji", "dictionary" },
    providers = {
      dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      emoji = {
        module = "blink-emoji",
        name = "Emoji",
        opts = { insert = true },
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
    },
  },

  snippets = {
    preset = "luasnip",
  },

  cmdline = {
    sources = function()
      local type = vim.fn.getcmdtype()
      if type == "/" or type == "?" then
        return { "buffer" }
      end
      if type == ":" then
        return { "cmdline" }
      end
      return {}
    end,
  },

  completion = {
    accept = {
      -- experimental auto-brackets support
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      border = "single",
      draw = {
        treesitter = { "lsp" },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = "single",
      },
    },
    ghost_text = {
      enabled = true,
    },
  },

  signature = {
    enabled = true,
    window = { border = "single" },
  },

  keymap = {
    preset = "super-tab",
    ["<C-y>"] = { "select_and_accept" },

    -- ["<Tab>"] = { "snippet_forward", "fallback" },
    -- ["<S-Tab>"] = { "snippet_backward", "fallback" },
    --
    -- ["<Up>"] = { "select_prev", "fallback" },
    -- ["<Down>"] = { "select_next", "fallback" },
    -- ["<C-p>"] = { "select_prev", "fallback" },
    -- ["<C-n>"] = { "select_next", "fallback" },
    --
    ["<S-k>"] = { "scroll_documentation_up", "fallback" },
    ["<S-j>"] = { "scroll_documentation_down", "fallback" },

    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    -- ["<C-e>"] = { "hide", "fallback" },
  },
}

blink.setup(config)
