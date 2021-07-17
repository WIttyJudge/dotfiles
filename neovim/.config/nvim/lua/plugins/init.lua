-- require all lua plugins here

local plugins = {
  "formatter",
  "gitsigns",
  "go",
  "indentLine",
  "lspsaga",
  "lspkind-nvim",
  "lualine",
  "neoscroll-nvim",
  "nvim-colorizer",
  "nvim-comment",
  -- "nvim-echo-diagnostics",
  "nvim-hlslens",
  "nvim-tree",
  "nvim-tabline",
  "nvim-treesitter",
  "surround",
  "tagalong",
  -- "telescope",
  "todo-comments",
  "vim-rooter",
  "vim-startify",
}

for _, plugin in ipairs(plugins) do
  require('plugins/' .. plugin)
end

