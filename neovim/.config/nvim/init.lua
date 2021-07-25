-- Paq package manager
require('plugins')

-- Basic settings
require('settings/options')
require('settings/commands')
require('settings/mappings')
require('settings/colors')
require('settings/autocmds')

-- nvim-compe
require('settings/completion')

-- Lsp configuration
require('lsp')

-- Includes all configuration for installed plugins
require('plugins-config')

