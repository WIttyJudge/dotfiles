-- Setup all plugins here

local plugins = {
  "auto-save",
  "auto-session",
  "formatter",
  -- "gitsigns",
  "go",
  "indentLine",
  "lspsaga",
  "lspkind-nvim",
  "lualine",
  "neoscroll-nvim",
  "nvim-colorizer",
  "nvim-comment",
  "nvim-hlslens",
  "nvim-tree",
  "tabline",
  "nvim-treesitter",
  "surround",
  "telescope",
  "todo-comments",
  "trouble",
  "undotree",
  "vgit",
  "vim-dadbod-ui",
  "vim-rooter",
  "vim-startify",
  "vim-test",
  "vsnip",
}

for _, plugin in ipairs(plugins) do
   -- if plugin_is_enabled(plugin) then
    require('plugins-config/' .. plugin)
  -- end
end

local builtin_plugins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

-- Disabling builtins vim plugin
for _, plugin in ipairs(builtin_plugins) do
  vim.g["loaded_" .. plugin] = 1
end
