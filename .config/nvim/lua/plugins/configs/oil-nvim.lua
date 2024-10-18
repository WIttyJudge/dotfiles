-- https://github.com/stevearc/oil.nvim
local oil = require("oil")

local config = {
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["l"] = "actions.select",
    ["<C-k>"] = "actions.select_vsplit",
    ["<C-j>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["q"] = "actions.close",
    ["esc"] = "actions.close",
    ["r"] = "actions.refresh",
    ["h"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  },
  view_options = {
    show_hidden = true,
  },
}

oil.setup(config)
