local M = {}

local function disable_builtin_plugins()
  local plugins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
  }

  for _, plugin in ipairs(plugins) do
    vim.g["loaded_" .. plugin] = 1
  end
end

local function load_modules()
  local core_modules = {
    'core.options',
    'core.commands',
    'core.mappings',
    'core.colors',
    'core.autocmds',
    -- nvim-compe
    'core.completion'
  }

  for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
       print("Error loading " .. module .. "\n\n" .. err)
       -- error("Error loading " .. module .. "\n\n" .. err)
    end
  end
end

function M.load()
  require('core.global_functions')

  disable_builtin_plugins()
  -- https://github.com/lewis6991/impatient.nvim
  if pcall(require, 'impatient') then
    require 'impatient'
  else
    vim.notify('impatient.nvim not installed', vim.log.levels.WARN)
  end
 
  load_modules()

  -- Test filetype.lua
  -- @see https://neovim.discourse.group/t/introducing-filetype-lua-and-a-call-for-help/1806
  -- vim.g.do_filetype_lua = 1

  vim.g.did_load_filetypes = 0
  vim.g.do_filetype_lua = 1
end

return M
