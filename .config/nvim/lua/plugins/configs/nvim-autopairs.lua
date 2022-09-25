-- https://github.com/windwp/nvim-autopairs
local autopairs_present, nvim_autopairs = pcall(require, "nvim-autopairs")
local cmp_present, cmp = pcall(require, "cmp")

if not autopairs_present then
  return
end

local config = {
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
}

nvim_autopairs.setup(config)

if not cmp_present then
  return
end

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
