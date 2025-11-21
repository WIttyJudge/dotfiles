local has_blink, blink = pcall(require, "blink.cmp")

local globalCapabilities = {
  workspace = {
    fileOperations = {
      didRename = true,
      willRename = true,
    },
  },
}

local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  has_blink and blink.get_lsp_capabilities() or {},
  globalCapabilities or {}
)

return capabilities
