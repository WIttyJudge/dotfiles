-- https://github.com/williamboman/mason.nvim
local present, mason = pcall(require, "mason")

if not present then
  return
end

local config = {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

mason.setup(config)

-- https://github.com/williamboman/mason-lspconfig.nvim
local present, mason_lspconfig = pcall(require, "mason-lspconfig")

if not present then
  return
end

local config = {
  automatic_installation = true,
  -- ensure_installed = {
  --   "rust_analyzer", 
  --   "pyright",
  --   "solargraph",
  --   "golangci_lint_ls",
  --   "gopls",
  --   "bashls"
  -- },
}

mason_lspconfig.setup(config)
