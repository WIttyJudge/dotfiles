-- https://github.com/folke/snacks.nvim
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Deal with big files.
    bigfile = {
      notify = false,
    },
    -- When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.
    quickfile = {},
    -- Scope detection, text objects and jumping based on treesitter or indent.
    scope = {},
    -- Picker for selecting items.
    picker = {
      actions = {
        sidekick_send = function(...)
          return require("sidekick.cli.picker.snacks").send(...)
        end,
      },
      win = {
        input = {
          keys = {
            ["<a-a>"] = {
              "sidekick_send",
              mode = { "n", "i" },
            },
          },
        },
      },
    },
    -- Indent guides and scopes.
    indent = {
      indent = {
        char = "┊",
      },
      scope = {
        enabled = false,
      },
    },
    -- Pretty vim.notify
    notifier = {},
    -- Better vim.ui.input.
    input = {},
    -- Auto-show LSP references and quickly navigate between them
    words = {},
    -- Distraction-free coding.
    zen = {},
    -- Beautiful declarative dashboards.
    dashboard = {
      preset = {
        header = [[
      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
            ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "g", desc = "Grep", action = ":lua Snacks.dashboard.pick('live_grep')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
  keys = require("core.plugin_mappings").snacks,
}
