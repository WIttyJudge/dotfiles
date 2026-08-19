-- https://github.com/numToStr/Comment.nvim
return {
  "numToStr/Comment.nvim",
  opts = {
    mappings = false,
  },
  event = "VeryLazy",
  keys = require("core.plugin_mappings").comment_nvim,
}
