local M = {}

function M.get_lsp_client_name(msg)
  msg = msg or "No LSP Client"
  local bufnr = vim.api.nvim_get_current_buf()
  local client = vim.lsp.buf_get_clients(bufnr)

  if #client == 0 then
    return msg
  end

  return client[1]["name"]
end

return M
