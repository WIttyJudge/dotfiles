-- https://github.com/kyazdani42/nvim-tree.lua
-- vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '✹',
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = ""
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = ""
  }
}

  -- custom mappings
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  { key = { "<CR>", "l", "<2-LeftMouse>" }, cb = tree_cb("edit") },
  { key = "v", cb = tree_cb("vsplit") },
  { key = "b", cb = tree_cb("split") },
  { key = "t", cb = tree_cb("tabnew") }, 
  { key = "dd", cb = tree_cb("remove") },
  { key = "?", cb = tree_cb("toggle_help") }, -- Press Enter
  { key = { "<CR>" }, cb = tree_cb("cd") },
  { key = "h", cb = tree_cb("close_node") }, -- default mappings
  { key = "<", cb = tree_cb("prev_sibling") },
  { key = ">", cb = tree_cb("next_sibling") },
  { key = "P", cb = tree_cb("parent_node") },
  { key = "<Tab>", cb = tree_cb("preview") },
  { key = "K", cb = tree_cb("first_sibling") },
  { key = "J", cb = tree_cb("last_sibling") },
  { key = "I", cb = tree_cb("toggle_ignored") },
  { key = "H", cb = tree_cb("toggle_dotfiles") },
  { key = "R", cb = tree_cb("refresh") },
  { key = "a", cb = tree_cb("create") },
  { key = "r", cb = tree_cb("rename") },
  { key = "<C->", cb = tree_cb("full_rename") },
  { key = "x", cb = tree_cb("cut") }, 
  { key = "c", cb = tree_cb("copy") },
  { key = "p", cb = tree_cb("paste") },
  { key = "y", cb = tree_cb("copy_name") },
  { key = "Y", cb = tree_cb("copy_path") },
  { key = "gy", cb = tree_cb("copy_absolute_path") },
  { key = "[c", cb = tree_cb("prev_git_item") },
  { key = "}c", cb = tree_cb("next_git_item") },
  { key = "-", cb = tree_cb("dir_up") }, 
  { key = "q", cb = tree_cb("close") }
}

local config = {
  -- open the tree when running this setup function
  open_on_setup = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup = { 'startify', 'dashboard' },
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually) 
  update_cwd = true,
  -- update_to_buf_dir   = {
  --   enable = true,
  --   auto_open = true,
  -- },
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = true,
  },
  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 35,
    -- if true the tree will resize itself after opening a file
    auto_resize = true,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = true,
      -- list of mappings to set on the tree manually
      list = list
    }
  }
}

require'nvim-tree'.setup(config)
