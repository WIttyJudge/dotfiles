-- https://github.com/kristijanhusak/vim-dadbod-ui
local wk = require("which-key")

local options = {
  preset = "helix",

  spec = {
    {
      mode = { "n", "v" },
      { "<leader>c", group = "code" },
      -- { "<leader>d", group = "debug" },
      -- { "<leader>dp", group = "profiler" },
      { "<leader>f", group = "file/find" },
      { "<leader>g", group = "git" },
      { "<leader>s", group = "search" },
      { "g", group = "goto" },
      { "[", group = "prev" },
      { "]", group = "next" },
    },
  },
}

wk.setup(options)
