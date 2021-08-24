-- https://github.com/nvim-telescope/telescope.nvim

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local themes = require "telescope.themes"

require('telescope').setup {
  defaults = {
    prompt_prefix = "λ -> ",
    selection_caret = "|> ",

    layout_strategy = "horizontal",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",

    layout_config = {
      width = 0.90,
      height = 0.85,
      prompt_position = "top",
      -- preview_cutoff = 120,

      horizontal = {
        preview_width = function(_, cols, _)
          return math.floor(cols * 0.6)
        end
      },
      vertical = { width = 0.90, height = 0.90, preview_height = 0.7 }
    },

    -- Don't pass to normal mode with ESC, problem with telescope-project
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  },
  pickers = { 
    buffers = { 
      sort_lastused = true
    } 
  },
  extensions = {
    fzy_native = { 
      override_generic_sorter = true, 
      override_file_sorter = true 
    }
  }
}

-- require('telescope').load_extension('fzy_native')

-- CUSTOM FUNCTIONS

local M = {}

function M.find_all_files()
  builtin.find_files {
    find_command = {
      'rg', '--files', '-g', '!.git', '-g', '!node_modules', '--hidden'
    }
  }
end

function M.grep_prompt()
  local opts = {
    path_diplay = { "shorten" },
    search = vim.fn.input "Grep String |> "
  }

  builtin.grep_string(opts)
end

-- LSP
function M.lsp_code_actions()
  local opts = themes.get_cursor {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false
  }

  builtin.lsp_code_actions(opts)
end

-- Git
function M.git_branches() 
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
  }

  attach_mappings = function(_, map)
    actions.select_default:replace(actions.git_checkout)

    map("i", "<c-t>", false)
    map("n", "<c-t>", false)
    map("i", "<c-r>", false)
    map("n", "<c-r>", false)

    map("i", "<c-a>", actions.git_create_branch)
    map("n", "<c-a>", actions.git_create_branch)

    map("i", "<c-s>", actions.git_switch_branch)
    map("n", "<c-s>", actions.git_switch_branch)

    map("i", "<c-d>", actions.git_delete_branch)
    map("n", "<c-d>", actions.git_delete_branch)
    return true
  end,

  builtin.git_branches(opts)
end

return M
