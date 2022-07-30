-- https://github.com/kyazdani42/nvim-tree.lua

local present, nvim_tree = pcall(require, "nvim-tree")

if not present then
  return
end

local icons = require "internal.icons"

-- custom mappings
local tree_cb = require("nvim-tree.config").nvim_tree_callback
local list = {
  { key = { "<CR>", "l", "<2-LeftMouse>" }, cb = tree_cb "edit" },
  { key = "v", cb = tree_cb "vsplit" },
  { key = "b", cb = tree_cb "split" },
  { key = "t", cb = tree_cb "tabnew" },
  { key = "dd", cb = tree_cb "remove" },
  { key = "?", cb = tree_cb "toggle_help" }, -- Press Enter
  { key = { "<CR>" }, cb = tree_cb "cd" },
  { key = "h", cb = tree_cb "close_node" }, -- default mappings
  { key = "<", cb = tree_cb "prev_sibling" },
  { key = ">", cb = tree_cb "next_sibling" },
  { key = "P", cb = tree_cb "parent_node" },
  { key = "<Tab>", cb = tree_cb "preview" },
  { key = "K", cb = tree_cb "first_sibling" },
  { key = "J", cb = tree_cb "last_sibling" },
  { key = "I", cb = tree_cb "toggle_ignored" },
  { key = "H", cb = tree_cb "toggle_dotfiles" },
  { key = "R", cb = tree_cb "refresh" },
  { key = "a", cb = tree_cb "create" },
  { key = "r", cb = tree_cb "rename" },
  { key = "<C->", cb = tree_cb "full_rename" },
  { key = "x", cb = tree_cb "cut" },
  { key = "c", cb = tree_cb "copy" },
  { key = "p", cb = tree_cb "paste" },
  { key = "y", cb = tree_cb "copy_name" },
  { key = "Y", cb = tree_cb "copy_path" },
  { key = "gy", cb = tree_cb "copy_absolute_path" },
  { key = "[c", cb = tree_cb "prev_git_item" },
  { key = "}c", cb = tree_cb "next_git_item" },
  { key = "-", cb = tree_cb "dir_up" },
  { key = "q", cb = tree_cb "close" },
}

local config = {
  -- respect_buf_cwd = true,
  ignore_ft_on_setup = { "startify", "dashboard", "alpha" },
  diagnostics = {
    enable = false,
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  -- open_on_setup = true,
  -- open_on_tab = false,
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
