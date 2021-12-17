-- https://github.com/mfussenegger/nvim-dap

local dap = require('dap')
local map = require('custom/utils').map
local define_commands = require('settings/commands').define_commands
local icons = require('custom/icons').debug

vim.fn.sign_define("DapBreakpoint", icons.breakpoint)
vim.fn.sign_define("DapStopped", icons.stop)

-- Mappings
map('n', '<Leader>ds', ':lua require("plugins-config.nvim-dap").run()<CR>')
map('n', '<Leader>dq', ':lua require("plugins-config.nvim-dap").close()<CR>')
map('n', '<Leader>dt', ':lua require("dap").toggle_breakpoint()<CR>')
map('n', '<Leader>db', ':lua require("dap").step_back()<CR>')
map('n', '<Leader>dc', ':lua require("dap").continue()<CR>')
map('n', '<Leader>dC', ':lua require("dap").run_to_cursor()<CR>')
map('n', '<Leader>dd', ':lua require("dap").disconnect()<CR>')
map('n', '<Leader>dg', ':lua require("dap").session()<CR>')
map('n', '<F10>', ':lua require("dap").step_over()<CR>')
map('n', '<F11>', ':lua require("dap").step_into()<CR>')
map('n', '<F12>', ':lua require("dap").step_out()<CR>')
map('n', '<Leader>dp', ':lua require("dap").pause.toggle()<CR>')
map('n', '<Leader>dr', ':lua require("dap").repl.toggle()<CR>')

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
