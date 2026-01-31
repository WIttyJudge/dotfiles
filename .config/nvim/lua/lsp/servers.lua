-- READ MORE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

local servers = {
  bashls = {},
  lua_ls = {},
  -- if it does not works, install binaries from
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#golangci_lint_ls
  golangci_lint_ls = {
    cmd = { "golangci-lint-langserver" },
    filetypes = { "go", "gomod" },
    init_options = {
      command = { "golangci-lint", "run", "--out-format", "json" },
    },
  },
  gopls = {},
  dockerls = {},
}

return servers
