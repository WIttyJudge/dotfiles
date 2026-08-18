-- https://github.com/alvarosevilla95/luatab.nvim
return {
  "alvarosevilla95/luatab.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    modified = function()
      return ""
    end,
  },
}
