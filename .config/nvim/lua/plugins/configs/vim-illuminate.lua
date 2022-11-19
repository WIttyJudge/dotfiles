-- https://github.com/RRethy/vim-illuminate
local present, illuminate = pcall(require, "illuminate")

if not present then
  return
end

local config = {
  filetypes_denylist = {
    "dirvish",
    "alpha",
    "fugitive",
    "NvimTree",
    "TelescopePrompt",
  },

  -- set highest priority for treesitter, and disable regex search
  providers = { "treesitter", "lsp" },
}

illuminate.configure(config)
