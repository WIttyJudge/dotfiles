local map = require("internal.utils").map

local navic = require("nvim-navic")

function on_attach(client, bufnr)
	-- Plugins
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	-- Mappings

	map("n", "gd", function()
		require("telescope.builtin").lsp_definitions()
	end)
	map("n", "gr", function()
		require("telescope.builtin").lsp_references()
	end)
	map("n", "gi", function()
		require("telescope.builtin").lsp_implementations()
	end)

	map("n", "ca", function()
		vim.lsp.buf.code_action()
	end)

	map("n", "K", function()
		vim.lsp.buf.hover()
	end)

	map("n", "<Leader>ar", function()
		vim.lsp.buf.rename()
	end)

	map("n", "<Leader>ee", function()
		vim.diagnostic.open_float()
	end)
	map("n", "<Leader>ej", function()
		vim.diagnostic.goto_next()
	end)
	map("n", "<Leader>ek", function()
		vim.diagnostic.goto_prev()
	end)
end

return on_attach
