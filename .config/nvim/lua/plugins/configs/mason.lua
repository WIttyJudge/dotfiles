-- https://github.com/williamboman/mason.nvim
local mason_present, mason = pcall(require, "mason")

if not mason_present then
  return
end

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

-- https://github.com/williamboman/mason-lspconfig.nvim
local mason_lsp_present, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_lsp_present then
  return
end

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
