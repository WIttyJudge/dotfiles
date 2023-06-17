-- https://github.com/kyazdani42/nvim-tree.lua
local nvim_tree = require("nvim-tree")

local icons = require("internal.icons")

-- custom mappings
local list = {
  { key = { "<CR>", "l", "<2-LeftMouse>" }, action = "edit" },
  { key = "v", action = "vsplit" },
  { key = "b", action = "split" },
  { key = "t", action = "tabnew" },
  { key = "dd", action = "remove" },
  { key = "?", action = "toggle_help" }, -- Press Enter
  { key = { "<CR>" }, action = "cd" },
  { key = "h", action = "close_node" }, -- default mappings
  { key = "<", action = "prev_sibling" },
  { key = ">", action = "next_sibling" },
  { key = "P", action = "parent_node" },
  { key = "<Tab>", action = "preview" },
  { key = "K", action = "first_sibling" },
  { key = "J", action = "last_sibling" },
  { key = "I", action = "toggle_ignored" },
  { key = "H", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  { key = "a", action = "create" },
  { key = "r", action = "rename" },
  { key = "<C->", action = "full_rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "[c", action = "prev_git_item" },
  { key = "}c", action = "next_git_item" },
  { key = "-", action = "dir_up" },
  { key = "q", action = "close" },
}

local config = {
  -- respect_buf_cwd = true,
  diagnostics = {
    enable = false,
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  update_cwd = true,
  view = {
    width = 35,
    mappings = {
      custom_only = true,
      list = list,
    },
  },
  git = {
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = icons.git.Unstaged,
          staged = icons.git.Staged,
          unmerged = icons.git.Unmerged,
          renamed = icons.git.Renamed,
          untracked = icons.git.Untracked,
          deleted = icons.git.Deleted,
          ignored = icons.git.Ignored,
        },
        folder = icons.folder,
        -- lsp = {
        --   hint = icons.diagnostics.Hint,
        --   info = icons.diagnostics.Info,
        --   warning = icons.diagnostics.Warn,
        --   error = icons.diagnostics.Error,
        -- }
      },
    },
  },
}

nvim_tree.setup(config)
