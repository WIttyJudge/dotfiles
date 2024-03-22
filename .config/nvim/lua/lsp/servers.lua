-- READ MORE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

local servers = {
	bashls = {},
	lua_ls = {},
	pyright = {},
	tsserver = {},
	solargraph = {},
	rust_analyzer = {
		cmd = {
			"rustup",
			"run",
			"stable",
			"rust-analyzer",
		},
		settings = {
			["rust-analyzer"] = {
				cargo = { loadOutDirsFromCheck = true },
				procMacro = { enable = true },
			},
		},
	},
	-- if it does not works, install binaries from
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#golangci_lint_ls
	golangci_lint_ls = {
		cmd = { "golangci-lint-langserver" },
		filetypes = { "go", "gomod" },
		init_options = {
			command = { "golangci-lint", "run", "--out-format", "json" },
		},
	},
	gopls = {
		cmd = { "gopls", "--remote=auto" },
		filetypes = { "go", "gomod" },
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
			},
		},
	},
}

-- CONFIGURE RUST_ANALYZER SERVER.
-- READ IT WHEN YOU NEED IT.

-- local rt_status_ok, rt = pcall(require, "rust-tools")
-- if not rt_status_ok then
-- 	print("no rust-tools")
-- 	return
-- end
--
-- local rust_opts = {
-- 	tools = {
-- 		autoSetHints = false,
-- 		hover_actions = { border = false },
-- 		cache = true,
-- 	},
-- 	server = {
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 		cmd = {
-- 			"rustup",
-- 			"run",
-- 			"stable",
-- 			"rust-analyzer",
-- 		},
-- 		settings = {
-- 			["rust-analyzer"] = {
-- 				diagnostics = {
-- 					experimental = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- }
--
-- rt.setup(rust_opts)

return servers
