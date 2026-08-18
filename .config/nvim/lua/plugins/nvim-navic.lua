-- https://github.com/SmiteshP/nvim-navic
return {
  "SmiteshP/nvim-navic",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = {
    highlight = true,
    depth_limit = 7,
    lazy_update_context = true,
  },
}
