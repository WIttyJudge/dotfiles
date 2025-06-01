-- https://github.com/hrsh7th/nvim-cmp
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    presets = {
      bottom_search = true,
      command_palette = true,
    },
  },
}
