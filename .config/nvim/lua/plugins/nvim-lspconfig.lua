return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "mason-org/mason.nvim", version = "1.11.0" },
    { "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    local icons = require("internal.icons")
    local servers = require("lsp.servers")
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

    local config = {
      diagnostics = {
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
      },
    }

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    local mason_lsp_config = {
      automatic_installation = false,
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            -- filetypes = (servers[server_name] or {}).filetypes,
          })
        end,
      },
    }

    vim.diagnostic.config(config.diagnostics)
    mason.setup()
    mason_lspconfig.setup(mason_lsp_config)
  end,
}
