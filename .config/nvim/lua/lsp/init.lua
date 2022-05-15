-- https://github.com/neovim/nvim-lspconfig

-- Global configs
-- local handlers = require('lsp/handlers')
local on_attach = require('lsp.on_attach')
local servers = require('lsp.servers')

local nvim_lsp = require('lspconfig')

require('lsp.handlers').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable completion triggered by <c-x><c-o>
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

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

-- Define servers
for server, config in pairs(servers) do
  setup_server(server, config)
end
