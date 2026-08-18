-- https://github.com/folke/todo-comments.nvim
return {
  "folke/todo-comments.nvim",
  event = "BufReadPre", -- needed to highlight keywords
  keys = require("core.mappings").todo_comments,
  config = true,
}
