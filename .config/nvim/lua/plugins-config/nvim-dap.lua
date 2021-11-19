-- https://github.com/mfussenegger/nvim-dap

local dap = require('dap')
local set_keymap = require('custom/utils').set_keymap
local define_commands = require('settings/commands').define_commands
local icons = require('custom/icons').debug

vim.fn.sign_define("DapBreakpoint", icons.breakpoint)
vim.fn.sign_define("DapStopped", icons.stop)

-- Mappings
set_keymap('n', '<Leader>ds', ':lua require("plugins-config.nvim-dap").run()<CR>')
set_keymap('n', '<Leader>dq', ':lua require("plugins-config.nvim-dap").close()<CR>')
set_keymap('n', '<Leader>dt', ':lua require("dap").toggle_breakpoint()<CR>')
set_keymap('n', '<Leader>db', ':lua require("dap").step_back()<CR>')
set_keymap('n', '<Leader>dc', ':lua require("dap").continue()<CR>')
set_keymap('n', '<Leader>dC', ':lua require("dap").run_to_cursor()<CR>')
set_keymap('n', '<Leader>dd', ':lua require("dap").disconnect()<CR>')
set_keymap('n', '<Leader>dg', ':lua require("dap").session()<CR>')
set_keymap('n', '<F10>', ':lua require("dap").step_over()<CR>')
set_keymap('n', '<F11>', ':lua require("dap").step_into()<CR>')
set_keymap('n', '<F12>', ':lua require("dap").step_out()<CR>')
set_keymap('n', '<Leader>dp', ':lua require("dap").pause.toggle()<CR>')
set_keymap('n', '<Leader>dr', ':lua require("dap").repl.toggle()<CR>')

-- Define commands
local commands_list = {
  [[ command! BreakpointToggle :lua require('dap').toggle_breakpoint() ]], 

  [[ command! DapREPL :lua require('dap').repl.toggle() ]], 
  [[ command! DapStart :lua require('plugins-config.nvim-dap').run() ]], 
  [[ command! DapClose :lua require('plugins-config.nvim-dap').close() ]], 
}
define_commands(commands_list)

-- ADAPTERS
dap.adapters.go = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/apps/vscode-go/dist/debugAdapter.js' }
}
dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug',
    request = 'launch',
    showLog = false,
    program = "${file}",
    dlvToolPath = vim.fn.exepath('dlv')
  }
}

local M = {}

function M.run()
  require("dapui").open()
  dap.continue()
end

function M.close()
  -- dap.disconnect()
  dap.close();
  dap.repl.close()
  require("dapui").close()
end

return M
