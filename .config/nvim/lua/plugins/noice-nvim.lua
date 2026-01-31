-- https://github.com/hrsh7th/nvim-cmp
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lsp = {
      signature = {
        enabled = false,
      },
    },
    presets = {
      -- use a classic bottom cmdline for search
      bottom_search = true,
      -- position the cmdline and popupmenu together
      command_palette = true,
      -- long messages will be sent to a split
      long_message_to_split = true,
      -- add a border to hover docs and signature help
      lsp_doc_border = true,
    },
  },
}
