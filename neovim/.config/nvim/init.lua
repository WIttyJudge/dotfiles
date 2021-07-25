-- Vim-plug
-- vim.cmd([[
-- source $HOME/.config/nvim/settings/plugins.vim
-- ]])

-- Paq package manager
require('plugins')

-- Configs
require('settings/options')
require('settings/commands')
require('settings/mappings')
require('settings/colors')
require('settings/autocmds')

-- nvim-compe
require('settings/completion')

-- Lsp config
require('lsp')

-- Plugins Config
require('plugins-config')

