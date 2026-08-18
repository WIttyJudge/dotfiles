-- https://github.com/nguyenvukhang/nvim-toggler
return {
  "nguyenvukhang/nvim-toggler",
  opts = {
    remove_default_keybinds = false,
    remove_default_inverses = false,
    inverses = {
      ["true"] = "false",
      ["!="] = "==",
      ["asc"] = "desc",
      ["ASC"] = "DESC",
    },
  },
  keys = require("core.mappings").toggler,
}
