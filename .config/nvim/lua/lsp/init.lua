-- https://github.com/neovim/nvim-lspconfig

local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

-- Global configs
-- local handlers = require('lsp/handlers')
local on_attach = require('lsp.on_attach')
local servers = require('lsp.servers')

require('lsp.handlers').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- We don't need to use it cmp_nvim_lsp sets all default values
-- cmp_nvim_lsp sets all default values.
-- capabilities.textDocument.completion.completionItem = {
--   snippetSupport = true,
--   preselectSupport = true,
--   insertReplaceSupport = true,
--   labelDetailsSupport = true,
--   deprecatedSupport = true,
--   commitCharactersSupport = true,
--   tagSupport = { valueSet = { 1 } },
--   resolveSupport = {
--     properties = {
--       "documentation",
--       "detail",
--       "additionalTextEdits",
--     },
--   },
-- }

-- Enable completion triggered by <c-x><c-o>
-- vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

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

  lspconfig[server_name].setup(config)
end

-- Define servers
for server, config in pairs(servers) do
  setup_server(server, config)
end
