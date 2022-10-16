-- https://github.com/RRethy/vim-illuminate
local present, illuminate = pcall(require, "illuminate")

if not present then
  return
end

local config = {
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "NvimTree",
    "TelescopePrompt",
  },
}

illuminate.configure(config)
