local cmd = vim.api.nvim_create_user_command

-- cmd(
--   "FileType",
--   function() print(vim.bo.filetype) end,
--   {desc = "Execute files"}
-- )

cmd(
  "WhitespaceClean",
  "%s/s+$//e",
  {}
)

cmd(
  "RunCommand",
  function() require('internal.quickrun').run_command() end,
  {desc = "Execute files"}
)

cmd(
  "GitBlameByLineToggle",
  "Gitsigns toggle_current_line_blame",
  {desc = "Toggle Git blame"}
)

cmd(
  "SpectreOpen",
  function() require('spectre').open() end,
  {desc = "nvim-spectre plugin"}
)

cmd(
  "CommentBox",
  "CBcbox10",
  {desc = "comment-box plugin"}
)
