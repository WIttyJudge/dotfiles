local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local conf = require('telescope.config')

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--hidden',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },

    layout_strategy = "horizontal",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",

    layout_config = {
      prompt_position = 'top',
    },

    prompt_prefix = "λ -> ",
    selection_caret = "|> ",
    -- Don't pass to normal mode with ESC, problem with telescope-project
    -- mappings = {
    --   i = {
    --     ["<esc>"] = actions.close,
    --   },
    -- },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return M
