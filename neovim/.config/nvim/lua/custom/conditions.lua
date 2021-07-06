local M = {}

function M.buffer_not_empty() 
  return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

function M.hide_in_width()
  local width = vim.fn.winwidth(0) / 2

  if width < 50 then
    return false
  end

  return true
end

function M.check_git_workspace() 
  local filepath = vim.fn.expand('%:p:h')
  local gitdir = vim.fn.finddir('.git', filepath .. ';')
  return gitdir and #gitdir > 0 and #gitdir < #filepath
end

function M.check_active_lsp() 
  local bufnr = vim.api.nvim_get_current_buf()
  local client = vim.lsp.buf_get_clients(bufnr)

  if #client == 0 then
    return false
  end

  return true
end

function M.is_file()
    return vim.bo.buftype ~= 'nofile'
end

return M
