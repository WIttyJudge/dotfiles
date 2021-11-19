-- https://github.com/rcarriga/nvim-dap-ui

local config = {
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r"
  },
  sidebar = { size = 80 },
  tray = { size = 10 },
  floating = { max_width = 0.9, max_height = 0.5, border = vim.g.border_chars }
}

require("dapui").setup(config)
