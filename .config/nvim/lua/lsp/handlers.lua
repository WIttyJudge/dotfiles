local M = {}
local icons = require("internal.icons")

function M.setup()
	-- Define custom icons
	local signs = {
		Error = icons.diagnostics.Error,
		Warn = icons.diagnostics.Warn,
		Info = icons.diagnostics.Info,
		Hint = icons.diagnostics.Hint,
	}
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { texthl = hl, text = icon, numhl = "" })
	end

	local config = {
		-- underline = false,
		-- virtual_text = false,
		-- update_in_insert = true,

		signs = { active = signs },
		severity_sort = true,
		float = {
			focused = false,
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
end

return M
