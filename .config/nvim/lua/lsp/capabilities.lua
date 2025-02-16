-- Default LSP server settigns
-- local M = vim.lsp.protocol.make_client_capabilities()

-- local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not ok then
-- 	vim.notify("Could not load nvim-cmp")
-- 	return
-- end

-- M.workspace.didChangeWatchedFiles.dynamicRegistration = true

-- Add additional capabilities supported by nvim-cmp
local M = require('blink.cmp').get_lsp_capabilities()

-- Enable LSP folddingRange capability
-- M.textDocument.foldingRange = {
-- 	dynamicRegistration = true,
-- 	lineFoldingOnly = true,
-- }

return M
