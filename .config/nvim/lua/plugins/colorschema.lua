return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  priority = 1000,
  opts = {
    flavour = "mocha",
    integrations = {
      aerial = true,
      diffview = true,
      blink_cmp = true,
      dadbod_ui = true,
      grug_far = true,
      gitsigns = true,
      illuminate = true,
      mason = true,
      snacks = true,
    },
  },
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
