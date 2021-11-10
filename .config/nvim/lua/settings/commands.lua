-- execute goimports linter
-- vim.cmd([[ command! Goimports :lua require('custom.go.format').goimports(1000) ]])

local commands_list = {
  -- General
  [[ command! Filetype execute 'lua print(vim.bo.filetype)' ]], 

  -- Git
  [[ command! GitBlameByLineToggle :Gitsigns toggle_current_line_blame ]],

  -- Execute files
  [[ "FileType", "go", "command! GoRun :call mappings#RunWith('go run')" ]],
  [[ "FileType", "sh", "command! BashRun :call mappings#RunWith('bash')" ]],
  [[ "FileType", "javascript", "command! JsRun :call mappings#RunWith('node')" ]],
  [[
    "FileType", "typescript",
    "command! TsRun :call mappings#RunWith('npx ts-node')"
  ]], -- Lsp
  [[ command! LspFormat execute 'lua vim.lsp.buf.formatting_sync(nil, 1000)' ]]
}

local function define_commands(commands)
  for _, command in pairs(commands) do
    vim.cmd(command)
  end
end

define_commands(commands_list)
