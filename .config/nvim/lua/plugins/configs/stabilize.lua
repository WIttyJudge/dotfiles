-- https://github.com/luukvbaal/stabilize.nvim
local present, stabilize = pcall(require, "stabilize")

if not present then
  return
end

local config = {
  force = true,
  forcemark = nil,
  ignore = {
    filetype = { "help", "list", "Trouble", "fugitive" },
    buftype = { "terminal", "quickfix", "loclist" },
  },
  nested = nil,
}

stabilize.setup(config)
