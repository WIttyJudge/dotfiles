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

-- eg. f023 is a locker
function M.convert_utf8_to_character(code)
  if type(code) == 'string' then code = tonumber('0x' .. code) end
  local c = string.char
  if code <= 0x7f then return c(code) end
  local t = {}
  if code <= 0x07ff then
    t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
    t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  elseif code <= 0xffff then
    t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  else
    t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  end
  return table.concat(t)
end

return M
