-- https://github.com/folke/todo-comments.nvim
local present, todo_comments = pcall(require, "todo-comments")

if not present then
  return
end

local config = {
  signs = false,
}

todo_comments.setup(config)
