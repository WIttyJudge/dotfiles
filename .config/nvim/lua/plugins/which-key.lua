-- https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = require("core.mappings").which_key,
  opts = {
    preset = "helix",
    spec = {
      {
        mode = { "n", "v" },
        { "<leader><tab>", group = "Tabs" },
        { "<leader>c", group = "Code" },
        -- { "<leader>d", group = "Debug" },
        -- { "<leader>dp", group = "Profiler" },
        { "<leader>f", group = "File/Find" },
        { "<leader>g", group = "Git" },
        -- { "<leader>q", group = "Quit/Session" },
        { "<leader>q", group = "Quit" },
        { "<leader>s", group = "Search" },
        { "<leader>u", group = "UI" },
        -- { "<leader>x", group = "Diagnostics/Quickfix" },
        { "[", group = "Prev" },
        { "]", group = "Next" },
        { "g", group = "Goto" },
        { "<leader>a", group = "AI" },
        -- { "gs", group = "Surround" },
        -- { "z", group = "Fold" },
      },
    },
  },
}
