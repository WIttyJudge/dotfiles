-- https://github.com/catppuccin/nvim
return {
  "catppuccin/nvim",
  -- lazy = true,
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    auto_integrations = true,
  },
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
