-- Global configs
require('lsp/on_attach')

-- support languages
require('lsp/cssls')
require('lsp/docker-ls')
require('lsp/html')
require('lsp/jsonls')
require('lsp/ruby-ls')
require('lsp/svelte-ls')
require('lsp/vimls-ls')

-- require("nvim-ale-diagnostic")
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     virtual_text = false,
--     signs = true,
--     update_in_insert = true,
--   }
-- )
