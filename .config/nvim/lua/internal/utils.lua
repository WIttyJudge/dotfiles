local M = {}

-- Bind keymap
function M.map(mode, key, action, opts)
  local default_opts = { noremap = true, silent = true}
  local opts = opts or {}
  -- rewrite default_opts if opts defined
  default_opts = vim.tbl_extend("force", default_opts, opts)

  return vim.api.nvim_set_keymap(mode, key, action, default_opts)
end

-- Delete keymap
function M.unmap(mode, lhs)
  return vim.api.nvim_del_keymap(mode, lhs)
end

-- Get home dir ($HOME)
function M.get_homedir() return os.getenv('HOME') end

return M
