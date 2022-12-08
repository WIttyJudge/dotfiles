local M = {}

local commands_list = {
  -- General
  [[ command! Filetype execute 'lua print(vim.bo.filetype)' ]],
  [[ command! WhitespaceClean :%s/\s\+$//e ]],

  -- Execute files
  [[ command! RunCommand execute 'lua require("internal.quickrun").run_command()' ]],

  -- Git
  [[ command! GitBlameByLineToggle :Gitsigns toggle_current_line_blame ]],

  -- Lsp
  [[ command! LspFormat execute 'lua vim.lsp.buf.formatting_sync(nil, 1000)' ]],

  -- nvim-spectre
  [[ command! SpectreOpen execute 'lua require("spectre").open()' ]],
  [[ command! SpectreOpenCurrentFile execute 'lua require("spectre").open_file_search()' ]],
}

-- list of commands dependent on autogroup.
-- local autogroups_list = {
--   _general = {}
-- }
-- require('core.autocmds').define_augroups(autogroups_list)

function M.define_commands(commands)
  for _, command in pairs(commands) do
    vim.cmd(command)
  end
end

M.define_commands(commands_list)

return M
