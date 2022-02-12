do
  -- https://github.com/lewis6991/impatient.nvim
  local ok, _ = pcall(require, 'impatient')

  if not ok then
    vim.notify('impatient.nvim not installed', vim.log.levels.WARN)
  end
end

-- Functions the whole lua code can use without any require.
-- eg. dump({1, 2, 3})
require('custom.global_functions')

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
     error("Error loading " .. module .. "\n\n" .. err)
  end

end

-- Paq package manager
require('plugins')

-- LSP configuration
require('lsp')

-- Includes all configurations for installed plugins
require('plugins-config')

