-- execute goimports linter
-- vim.cmd([[ command! Goimports :lua require('custom.go.format').goimports(1000) ]])
local commands_list = {
  -- General
  [[ command! Filetype execute 'lua print(vim.bo.filetype)' ]], 

  -- Git
  [[ command! GitBlameByLineToggle :Gitsigns toggle_current_line_blame ]],

  -- Lsp
  [[ command! LspFormat execute 'lua vim.lsp.buf.formatting_sync(nil, 1000)' ]],

  -- nvim-spectre
  [[ command! SpectreOpen execute 'lua require("spectre").open()' ]],
  [[ command! SpectreOpenCurrentFile execute 'lua require("spectre").open_file_search()' ]]
}

-- list of commands dependent on autogroup.
local autogroups_list = {
  -- Execute files
  _file_execution = {
    { "FileType", "rust", "command! CargoRun :call mappings#RunWith('cargo run')" },
    { "FileType", "go", "command! GoRun :call mappings#RunWith('go run')" },
    { "FileType", "sh", "command! BashRun :call mappings#RunWith('bash')" },
    { "FileType", "javascript", "command! JsRun :call mappings#RunWith('node')" }
  }
}

local M = {}

function M.define_commands(commands)
  for _, command in pairs(commands) do
    vim.cmd(command)
  end
end

M.define_commands(commands_list)

require('core.autocmds').define_augroups(autogroups_list)

return M
