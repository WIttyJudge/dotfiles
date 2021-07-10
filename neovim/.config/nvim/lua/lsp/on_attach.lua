-- local nvim_lsp = require('lspconfig')
-- require'lspinstall'.setup() -- important

local M = {}

local custom_function = require('custom.functions')

local mappings = {
  ['gd'] = ":lua vim.lsp.buf.definition()<CR>",
  ['K'] = ":Lspsaga hover_doc<CR>",
  ['<Leader>ar'] = ":Lspsaga rename<CR>",
  [']e'] = ":Lspsaga diagnostic_jump_next<CR>",
  ['[e'] = ":Lspsaga diagnostic_jump_prev<CR>",
}

-- https://github.com/ray-x/lsp_signature.nvim#full-configuration
local lsp_signature_cfg = {
  use_lspsaga = true   -- set to true if you want to use lspsaga popup
}

local function nnoremap(lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, {noremap = true, silent = true})
end

function M.on_attach()
  -- Init mappings
  for lhs, rhs in pairs(mappings) do
    nnoremap(lhs, rhs)
  end

  -- Init lsp_signature plugin
  require 'lsp_signature'.on_attach(lsp_signature_cfg)

  print('LSP client', custom_function.get_lsp_client_name(), 'was attached')
end

return M

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { "solargraph" }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup { on_attach = on_attach }
-- end
-- local servers = require'lspinstall'.installed_servers()
-- for _, server in pairs(servers) do
--   require'lspconfig'[server].setup{}
-- end
