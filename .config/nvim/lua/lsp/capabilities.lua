local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
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
  has_cmp and cmp_nvim_lsp.default_capabilities() or {},
  has_blink and blink.get_lsp_capabilities() or {},
  globalCapabilities or {}
)

return capabilities
