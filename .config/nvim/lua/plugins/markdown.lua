-- https://github.com/OXY2DEV/markview.nvim
return {
  "OXY2DEV/markview.nvim",
  lazy = false,      -- Recommended
  -- ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    experimental = { check_rtp_message = false }
  }
}
