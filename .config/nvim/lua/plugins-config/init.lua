-- Setup all plugins here

local plugins = {
  -- "alpha-nvim",
  "auto-save",
  "better-escape",
  "dashboard-nvim",
  "formatter",
  "gitsigns",
  "go-nvim",
  "hop",
  "indentLine",
  "lspsaga",
  "lspkind-nvim",
  "lualine",
  "neoscroll-nvim",
  "notify",
  "nvim-autopairs",
  "nvim-colorizer",
  "nvim-comment",
  "nvim-dap-ui",
  "nvim-dap",
  "nvim-hlslens",
  "nvim-specte",
  "nvim-transparent",
  "nvim-tree",
  "tabline",
  "nvim-treesitter",
  "surround",
  "telescope",
  "todo-comments",
  "trouble",
  "true-zen",
  "undotree",
  "vim-dadbod-ui",
  -- "vim-go",
  "vim-rooter",
  "vim-startify",
  "vim-test",
  "vim-wordmotion",
  "vsnip",
}

for _, plugin in ipairs(plugins) do
  require('plugins-config.' .. plugin)
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
