-- https://github.com/lewis6991/gitsigns.nvim
local gitsigns = require("gitsigns")
local map = require("internal.utils").map

local function on_attach(bufnr)
  local gs = package.loaded.gitsigns

  -- Navigation
  map("n", "<leader>gj", function()
    if vim.wo.diff then return "]c" end
    vim.schedule(function() gs.next_hunk() end)
    return "<Ignore>"
  end, { expr = true })

  map("n", "<leader>gk", function()
    if vim.wo.diff then return "[c" end
    vim.schedule(function() gs.prev_hunk() end)
    return "<Ignore>"
  end, { expr = true })

  -- Actions
  map("n", "<leader>ga", gs.stage_hunk)
  map("v", "<leader>ga", function()
    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end)

  map("n", "<leader>gu", gs.reset_hunk)
  map("v", "<leader>gu", function()
    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end)

  map("n", "<leader>gp", gs.preview_hunk)
end

local config = {
  signs = {
    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "GitSignsChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  },
  on_attach = on_attach
  -- keymaps = {
  --   -- Default keymap options
  --   noremap = true,
  --
  --   ["n <leader>ga"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
  --   ["n <leader>gp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
  --
  --   -- ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
  --   -- ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
  --   -- ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
  --   -- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
  --
  --   -- Text objects
  --   ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
  --   ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
  -- },
}

gitsigns.setup(config)
