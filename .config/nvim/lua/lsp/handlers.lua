local M = {}
local icons = require("internal.icons")

function M.setup()
	-- Define custom icons
	local signs = {
		Error = icons.diagnostics.Error,
		Warn = icons.diagnostics.Error,
		Info = icons.diagnostics.Info,
		Hint = icons.diagnostics.Hint,
	}
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { texthl = hl, text = icon, numhl = "" })
	end

	local config = {
		-- virtual_text = {
		--    prefix = "",
		-- },

		-- disable virtual text
		virtual_text = false,

		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = false,

		-- Disable virtual_text on file load
		virtual_text = false,
		-- virtual_text = {
		--   prefix = "",
		--   spacing = 0,
		-- },

		signs = true,
		update_in_insert = false,
	})
end

return M
