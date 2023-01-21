-- READ MORE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- Setup LSP for yaml, typescript, ruby, golang, rust, bash, html, css

local servers = {
  bashls = true,
  sumneko_lua = true,
  pyright = true,
  tsserver = true,
  solargraph = true,
  rust_analyzer = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
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
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
    },
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

return servers
