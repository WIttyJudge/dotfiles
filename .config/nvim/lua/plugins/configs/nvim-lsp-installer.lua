-- https://github.com/williamboman/nvim-lsp-installer
local present, lsp_installer = pcall(require, "nvim-lsp-installer")

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
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

lsp_installer.setup(config)
