-- https://github.com/nvim-telescope/telescope.nvim
local telescope = require("telescope")

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

local config = {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--no-ignore",
			"--smart-case",
			"--hidden",
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
			preview_cutoff = 120,

			horizontal = {
				preview_width = function(_, cols, _)
					return math.floor(cols * 0.6)
				end,
			},
			vertical = {
				width = 0.90,
				height = 0.90,
				preview_height = 0.7,
			},
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
		},
	},

  extensions = {
    smart_open = {
      match_algorithm = "fzf",
    },
  },
}

telescope.setup(config)

-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- https://github.com/princejoogie/dir-telescope.nvim
-- https://github.com/danielfalk/smart-open.nvim
telescope.load_extension("fzf")
telescope.load_extension("dir")
telescope.load_extension("smart_open")

-- CUSTOM FUNCTIONS
local M = {}

-- LSP
function M.lsp_code_actions()
	local opts = themes.get_cursor({
		winblend = 10,
		border = true,
		previewer = false,
		shorten_path = false,
	})

	builtin.lsp_code_actions(opts)
end

return M
