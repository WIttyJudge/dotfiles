local M = {}

-- Bind keymap
function M.map(mode, keys, command, opts)
  local options = { silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  if type(keys) == "table" then
    for _, keymap in ipairs(keys) do
      M.map(mode, keymap, command, opts)
    end
    return
  end

  vim.keymap.set(mode, keys, command, opts)
end

-- Delete keymap
function M.unmap(mode, lhs)
  return vim.api.nvim_del_keymap(mode, lhs)
end

-- Get home dir ($HOME)
function M.get_homedir()
  return os.getenv "HOME"
end

return M
