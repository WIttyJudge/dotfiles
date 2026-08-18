-- https://github.com/ray-x/go.nvim
return {
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
}
