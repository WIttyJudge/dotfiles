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
  -- "telescope",
  "todo-comments",
  -- "toggle-formatting",
  "undotree",
  "vim-rooter",
  "vim-startify",
  "vsnip",
}

for _, plugin in ipairs(plugins) do
   -- if plugin_is_enabled(plugin) then
    require('plugins/' .. plugin)
  -- end
end

