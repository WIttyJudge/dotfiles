local cmd = vim.cmd
local utils = require('internal/utils')

-- General
-- =====================================

local general_settings = vim.api.nvim_create_augroup('_general_settings', { clear = true })

-- Restore cursor to where it was when the file was closed
cmd([[
  if !&diff
    autocmd BufLeave * let b:winview = winsaveview()
    autocmd BufEnter * if exists('b:winview') | call winrestview(b:winview) | endif
  endif
]])

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.cmd [[
      setlocal wrap
      setlocal spell
    ]]
  end,
  group = general_settings,
  desc = "Spell check"
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function() 
    vim.highlight.on_yank({timeout = 200}) 
  end,
  group = general_settings,
  desc = "Highlight yanked text"
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
  command = "silent! checktime",
  group = general_settings,
  desc = "Reload modified changes automatically (autoread)"
})

-- Plugins 
-- =====================================

local plugins = vim.api.nvim_create_augroup('_plugins', { clear = true })

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { "sql", "mysql", "plsql" },
  callback = function() 
    require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
  end,
  group = plugins,
  desc = "vim-dadbod-completion-plugin"
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { 'plugins.lua' },
  command = "PackerCompile",
  group = plugins,
  desc = "packer-plugin"
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { "*.sum", "*.mod" },
  command = ":silent :GoModTidy",
  group = plugins,
  desc = "Golang plugins"
})

-- Linter
-- =====================================

local linter = vim.api.nvim_create_augroup('_linter', { clear = true })

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { "*.go" },
  command =  ":silent! lua require('go.format').goimport()",
  group = linter
})
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { "*.go" },
  command = ":silent! lua require('internal.go.format').goimports(1000)",
  group = linter
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { "*.rs" },
  command = "FormatWrite",
  group = linter
})

-- Auto Compile
-- =====================================

local auto_compile = vim.api.nvim_create_augroup('_auto_compile', { clear = true })

-- Compile suckless-tools on save
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = utils.get_homedir() .. "/suckless-tools/dwmblocks/config.h",
  command = "!cd ~/suckless-tools/dwmblocks; sudo make clean install && { killall -q dwmblocks;setsid -f dwmblocks }",
  group = auto_compile,
  desc = 'Dwmblocks suckless utils'
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = utils.get_homedir() .. "/suckless-tools/dwm/config.h",
  command = "!cd ~/suckless-tools/dwm; sudo make clean install",
  group = auto_compile,
  desc = 'DWM suckless utils'
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = utils.get_homedir() .. "/suckless-tools/dmenu/config.h",
  command = "!cd ~/suckless-tools/dmenu; sudo make clean install",
  group = auto_compile,
  desc = 'Dmenu suckless utils'
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = ".tmux.conf",
  command = "!tmux source-file %",
  group = auto_compile
})

return M
