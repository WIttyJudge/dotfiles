-- https://github.com/Wansmer/treesj
return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = { "TSJSplit", "TSJJoin" },
  keys = require("core.mappings").treesj,
  opts = {
    use_default_keymaps = false,
  },
}
