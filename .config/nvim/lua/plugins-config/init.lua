-- Setup all plugins here

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
  "undotree",
  "vim-rooter",
  "vim-startify",
  "vsnip",
}

for _, plugin in ipairs(plugins) do
   -- if plugin_is_enabled(plugin) then
    require('plugins-config/' .. plugin)
  -- end
end

-- Disabling the builtin vim plugin
vim.g.loaded_gzip         = 1
vim.g.loaded_tar          = 1
vim.g.loaded_tarPlugin    = 1
vim.g.loaded_zipPlugin    = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw        = 1
vim.g.loaded_netrwPlugin  = 1
vim.g.loaded_matchit      = 1
vim.g.loaded_matchparen   = 1
vim.g.loaded_spec         = 1
