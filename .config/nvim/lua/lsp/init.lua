-- https://github.com/neovim/nvim-lspconfig

local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

-- Global configs
-- local handlers = require('lsp/handlers')
local on_attach = require "lsp.on_attach"
local servers = require "lsp.servers"

require("lsp.handlers").setup()

local function setup_server(server_name, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }, config)

  lspconfig[server_name].setup(config)
end

-- Define servers
for server, config in pairs(servers) do
  setup_server(server, config)
end
