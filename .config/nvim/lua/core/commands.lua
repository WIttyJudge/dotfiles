local commands = {
  -- General
  { "FileType", "lua print(vim.bo.filetype)" },
  { "WhitespaceClean", "%s/s+$//e" },

  -- Execute files
  { "RunCommand", "lua require('internal.quickrun').run_command()" },

  -- Git
  { "GitBlameByLineToggle", "Gitsigns toggle_current_line_blame" },

  -- nvim-spectre
  { "SpectreOpen", "lua require('spectre').open()" },

  -- comment-box
  { "CommentBox", "CBcbox10" },
}

for _, command in ipairs(commands) do
  local opts = command[3] or {}
  vim.api.nvim_create_user_command(command[1], command[2], opts)
end
