local M = {}

function M.hide_in_width()
  local width = vim.fn.winwidth(0) / 2

  if width < 50 then
    return false
  end

  return true
end

function M.check_active_lsp() 
  local bufnr = vim.api.nvim_get_current_buf()
  local client = vim.lsp.buf_get_clients(bufnr)

  if #client == 0 then
    return false
  end

  return true
end

return M
