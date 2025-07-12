return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewFileHistory",
  },
  keys = {
    { "<Leader>gc", "<Cmd>DiffviewFileHistory<CR>", desc = "Open diff view file history" },
  },
  config = true,
}
