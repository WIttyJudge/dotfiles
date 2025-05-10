return {
  {
    "sQVe/sort.nvim",
    cmd = { "Sort" },
    config = true,
  },

  {
    "tzachar/highlight-undo.nvim",
    event = "BufEnter",
    config = true,
  },

  {
    "nacro90/numb.nvim",
    event = { "CmdlineEnter" },
    config = true,
  },

  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = true,
  },

  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = require("core.mappings").nvim_spider,
  },

  -- {
  --   "max397574/better-escape.nvim",
  --   config = true,
  -- },

  -- {
  -- 	"johmsalas/text-case.nvim",
  -- 	config = true,
  -- },
}
