-- https://github.com/nvim-telescope/telescope.nvim
local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local builtin = require "telescope.builtin"
local actions = require "telescope.actions"
local themes = require "telescope.themes"

local icons = require "internal.icons"

-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- https://github.com/LinArcX/telescope-command-palette.nvim
-- https://github.com/princejoogie/dir-telescope.nvim
local extensions_list = {
  "fzf",
  "command_palette",
  "dir",
}

local opts_cursor = {
  initial_mode = "normal",
  sorting_strategy = "ascending",
  layout_strategy = "cursor",
  results_title = false,
  layout_config = {
    width = 0.5,
    height = 0.4,
  },
}

local config = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },

    prompt_prefix = "λ -> ",
    selection_caret = "  ",

    initial_mode = "insert",

    preview = {
      timeout = 500,
      msg_bg_fillchar = "",
    },

    file_ignore_patterns = {
      ".git/",
      "node_modules",
    },

    dynamic_preview_title = true,

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
        end,
      },
      vertical = { width = 0.90, height = 0.90, preview_height = 0.7 },
    },

    -- Don't pass to normal mode with ESC, problem with telescope-project
    mappings = {
      i = {
        -- ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default + actions.center,
      },
      n = {
        ["q"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = {
        -- 'rg', '--files', '-g', '!.git', '-g', '!node_modules', '--hidden'
        "fd",
        "--type",
        "f",
        "--strip-cwd-prefix",
        "--hidden",
      },

      prompt_title = icons.ui.Search .. " Find Files",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    command_palette = {
      {
        "1. File",
        { "Search for Word", ":lua require('telescope.builtin').live_grep()", 1 },
      },
      {
        "2. Help",
        { "Search Help", ":lua require('telescope.builtin').help_tags()", 1 },
      },
      {
        "3. Neovim",
        { "checkhealth", ":checkhealth" },
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers", ":lua require('telescope.builtin').registers()" },
        { "options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { "buffers", ":Telescope buffers" },
        { "search history", ":lua require('telescope.builtin').search_history()" },
      },
      {
        "4. Set",
        { "cursor line", ":set cursorline!" },
        { "cursor column", ":set cursorcolumn!" },
        { "spell checker", ":set spell!" },
        { "relative number", ":set relativenumber!" },
      },
    },
  },
  lsp_references = vim.tbl_deep_extend("force", opts_cursor, {
    prompt_title = "References",
  }),
}

telescope.setup(config)

pcall(function()
  for _, ext in ipairs(extensions_list) do
    telescope.load_extension(ext)
  end
end)

-- CUSTOM FUNCTIONS
local M = {}

function M.find_all_files()
  builtin.find_files {
    find_command = {
      "rg",
      "--files",
      "-g",
      "!.git",
      "-g",
      "!node_modules",
      "--hidden",
      -- "fd", "--type", "f", "--strip-cwd-prefix", "--hidden"
    },
  }
end

function M.grep_prompt()
  local opts = {
    path_diplay = { "shorten" },
    search = vim.fn.input "Grep String |> ",
  }

  builtin.grep_string(opts)
end

-- LSP
function M.lsp_code_actions()
  local opts = themes.get_cursor {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  builtin.lsp_code_actions(opts)
end

return M
