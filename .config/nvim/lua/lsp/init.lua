-- https://github.com/neovim/nvim-lspconfig

-- Global configs
local on_attach = require('lsp/on_attach')
local icons = require('custom.icons')

local nvim_lsp = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Define custom icons
local signs = { 
  Error = icons.error,
  Warn = icons.warn,
  Info = icons.info,
  Hint = icons.hint
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { texthl = hl, text = icon, numhl = "" })
end

-- Enable completion triggered by <c-x><c-o>
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- Setup LSP for docker, yaml, typescript, ruby, golang, rust, bash, html, css
-- READ MORE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local servers = {
  dockerls = true,
  yamlls = true,
  rust_analyzer = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    settings = {
      ["rust-analyzer"] = {
        cargo =  { loadOutDirsFromCheck = true },
        procMacro =  { enable = true },
      }
    }
  },
  pyright = true,
  tsserver = {
    filetypes = {
      "javascript", "javascriptreact", "javascript.jsx", "typescript",
      "typescriptreact", "typescript.tsx"
    }
  },
  solargraph = { filetypes = { "ruby" } },
  gopls = {
    cmd = { "gopls", "serve" },
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      }
    }
  },
  bashls = {
    filetypes = { "sh" },
    cmd = { "bash-language-server", "start" },
  },
  html = {
    filetypes = { "html", "eruby" },
  },
  cssls = {
    settings = {
      css = { validate = true },
      less = { validate = true },
      scss = { validate = true }
    }
  }
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
    -- capabilities = capabilities,
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
    flags = {
      debounce_text_changes = 50,
    },
  }, config)

  nvim_lsp[server_name].setup(config)
end

for server, config in pairs(servers) do
  local ok, lsp_server = lsp_installer.get_server(server)
  if ok then
    if not lsp_server:is_installed() then
      lsp_server:install()
    end
  end

  setup_server(server, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,

      -- Disable virtual_text on file load
      virtual_text = false,
      -- virtual_text = {
      --   prefix = "",
      --   spacing = 0,
      -- },

      signs = true,
      update_in_insert = false
    })
