-- https://github.com/folke/todo-comments.nvim
return {
  "folke/todo-comments.nvim",
  event = "BufReadPre", -- needed to highlight keywords
  keys = require("core.plugin_mappings").todo_comments,
  config = true,
}
