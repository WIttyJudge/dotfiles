-- Vim-plug
vim.cmd([[
source $HOME/.config/nvim/settings/plugins.vim
]])

require('settings/options')
require('settings/commands')
require('settings/mappings')
require('settings/colors')
require('settings/autocmds')

-- nvim-compe
require('settings/completion')

-- Lsp Config
require('lsp')

-- Plugins Config
require('plugins')
