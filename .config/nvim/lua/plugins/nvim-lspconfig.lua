return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "mason-org/mason.nvim" },
  },
  opts = {
    -- READ MORE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
    servers = {
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
      copilot = {},
    },
  },
  config = function(_, opts)
    local icons = require("internal.icons")
    local capabilities = require("lsp.capabilities")
    local on_attach = require("lsp.on_attach")

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

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    for name, server_opts in pairs(opts.servers) do
      server_opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
      server_opts.on_attach = on_attach

      vim.lsp.config(name, server_opts)
      vim.lsp.enable(name)
    end

    local diagnosticsConfig = {
      -- signs = { active = signs },
      severity_sort = true,

      -- signs = { active = signs },
      float = {
        focused = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(diagnosticsConfig)

    require("mason").setup()
  end,
}
