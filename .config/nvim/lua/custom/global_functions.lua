-- Inspect a content
function _G.dump(...)
  print(unpack(vim.tbl_map(vim.inspect, { ... })))
end
