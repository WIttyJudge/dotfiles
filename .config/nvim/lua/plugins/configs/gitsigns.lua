-- https://github.com/lewis6991/gitsigns.nvim
local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

local config = {
  signs = {
    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "GitSignsChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  },
  -- hightlight numbers
  keymaps = {
    -- Default keymap options
    noremap = true,

    ["n <Leader>gj"] = {
      expr = true,
      "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'",
    },
    ["n <Leader>gk"] = {
      expr = true,
      "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'",
    },
    ["n <leader>gu"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',

    ["v <leader>ga"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ["v <leader>gu"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ["n <leader>ga"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n <leader>gp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',

    -- ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    -- ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    -- ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    -- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
  },
}

gitsigns.setup(config)
