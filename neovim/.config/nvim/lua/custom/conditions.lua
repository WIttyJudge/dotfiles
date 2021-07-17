local M = {}

-- Check whether the current buffer is empty
function M.buffer_not_empty() 
  return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

-- Check if the windows width is greater than a given number of columns
function M.hide_in_width(cols)
  local cols = cols or 50
  return vim.fn.winwidth(0) / 2 > cols
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
