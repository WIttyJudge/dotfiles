-- https://github.com/catppuccin/nvim
return {
  "catppuccin",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    default_integrations = true,
    auto_integrations = true,
  },
  init = function()
    vim.cmd.colorscheme("catppuccin-nvim")
  end,
}
