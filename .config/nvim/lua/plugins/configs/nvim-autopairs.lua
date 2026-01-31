-- https://github.com/windwp/nvim-autopairs
local nvim_autopairs = require("nvim-autopairs")
local cmp = require("cmp")

local config = {
  disable_filetype = { "TelescopePrompt", "vim" },
}

nvim_autopairs.setup(config)

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
