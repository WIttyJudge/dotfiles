-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local servers = require("lsp.servers")
local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

local mason_lsp_config = {
	automatic_installation = false,
	ensure_installed = vim.tbl_keys(servers),
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
				filetypes = (servers[server_name] or {}).filetypes,
			})
		end,
	},
}

mason.setup()
mason_lspconfig.setup(mason_lsp_config)
