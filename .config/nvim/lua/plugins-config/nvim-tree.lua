-- https://github.com/kyazdani42/nvim-tree.lua

vim.g.nvim_tree_width = 35
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_auto_close = 1
-- vim.g.nvim_tree_follow = 0 -- "0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = { unstaged = '✹', staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
  folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" }
}

vim.g.nvim_tree_disable_default_keybindings = 1

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
  -- custom mappings
  { key = {"<CR>", "l", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  { key = "v",                            cb = tree_cb("vsplit") },
  { key = "b",                            cb = tree_cb("split") },
  { key = "t",                            cb = tree_cb("tabnew") },
  { key = "dd",                           cb = tree_cb("remove") },
  { key = "?",                            cb = tree_cb("toggle_help") },
  -- Press Enter
  { key = {"<CR>"},                       cb = tree_cb("cd") },
  { key = "h",                            cb = tree_cb("close_node") },

  -- default mappings
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "P",                            cb = tree_cb("parent_node") },
  { key = "<Tab>",                        cb = tree_cb("preview") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "I",                            cb = tree_cb("toggle_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C->",                         cb = tree_cb("full_rename") },
  { key = "x",                            cb = tree_cb("cut") },
  { key = "c",                            cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "[c",                           cb = tree_cb("prev_git_item") },
  { key = "}c",                           cb = tree_cb("next_git_item") },
  { key = "-",                            cb = tree_cb("dir_up") },
  { key = "q",                            cb = tree_cb("close") },
}
