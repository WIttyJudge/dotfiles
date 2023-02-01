-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local mason_config = {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
}

mason.setup(mason_config)

local mason_lsp_config = {
  automatic_installation = false,
  -- ensure_installed = {
  --   "rust_analyzer",
  --   "pyright",
  --   "solargraph",
  --   "golangci_lint_ls",
  --   "gopls",
  --   "bashls"
  -- },
}

mason_lspconfig.setup(mason_lsp_config)
