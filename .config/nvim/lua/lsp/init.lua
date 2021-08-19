-- https://github.com/neovim/nvim-lspconfig

-- Global configs
local on_attach = require('lsp/on_attach')

local icons = require('custom.icons')

local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.fn.sign_define("LspDiagnosticsSignError", { text = icons.diagnostic.error })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = icons.diagnostic.warn })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = icons.diagnostic.hint })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = icons.diagnostic.info })

--Enable completion triggered by <c-x><c-o>
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- Setup LSP for docker, yaml, typescript, ruby, golang, rust, bash, html, css
local servers = {
  dockerls = true,
  yamlls = true,
  rust_analyzer = true,
  tsserver = {
    filetypes = { 
      "javascript", "javascriptreact", "javascript.jsx", "typescript", 
      "typescriptreact", "typescript.tsx" 
    },
  },
  solargraph = {
    filetypes = { "ruby" },
    capabilities = capabilities 
  },
  gopls = {
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  },
  bashls = {
    filetypes = { "sh" },
    cmd = { "bash-language-server", "start" },
  },
  html = {
    filetypes = { "html", "eruby"},
  },
  cssls = {
    settings = {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    },
  },
}

local function setup_server(server_name, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_attach = function(client, bufnr)
      on_attach.on_attach()
    end,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 50,
    },
  }, config)

  nvim_lsp[server_name].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,

    -- Disable virtual_text on file load
    virtual_text = false,
    -- virtual_text = {
    --   prefix = "",
    --   spacing = 0,
    -- },

    signs = true,
    update_in_insert = true,
  }
)
