local M = {}

local map = require('internal.utils').map

local mappings = {
  ['gd'] = ":lua vim.lsp.buf.definition()<CR>",
  -- ['gr'] = ":lua vim.lsp.buf.references()<CR>",
  ['gr'] = ":lua require('telescope.builtin').lsp_references()<CR>",

  -- ['K'] = ":Lspsaga hover_doc<CR>",
  ['K'] = ":lua vim.lsp.buf.hover()<CR>",
  -- ['<C-k>'] = ":Lspsaga signature_help<CR>",
  -- TODO: Need to map this.
  -- ['<C-k>'] = ":lua vim.lsp.buf.signature_help()<CR>",
  ['<Leader>ar'] = ":Lspsaga rename<CR>",

  ['<Leader>ee'] = ":lua vim.diagnostic.open_float()<CR>",
  ['<Leader>ej'] = ":lua vim.diagnostic.goto_next()<CR>",
  ['<Leader>ek'] = ":lua vim.diagnostic.goto_prev()<CR>",
}

local function nnoremap(key, action)
  vim.api.nvim_buf_set_keymap(0, 'n', key, action, {noremap = true, silent = true})
end

function M.on_attach()
  -- Init mappings
  for lhs, rhs in pairs(mappings) do
    nnoremap(lhs, rhs)
    map('n', '<c-k>', '<c-w><C-k>')
  end
end

return M
