-- Install packer  if it is not already installed.
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- https://github.com/lewis6991/impatient.nvim
require('impatient')

-- Functions the whole lua code can use without any require.
-- eg. dump({1, 2, 3})
require('custom/global_functions')

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

-- LSP configuration
require('lsp')

-- Includes all configurations for installed plugins
require('plugins-config')

