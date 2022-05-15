-- https://github.com/williamboman/nvim-lsp-installer
local present, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")

if not present then
  return
end

local config = {
  ensure_installed = {
    "rust_analyzer", 
    "pyright",
    "solargraph",
    "golangci_lint_ls",
    "gopls",
    "bashls"
  },
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

nvim_lsp_installer.setup(config)
