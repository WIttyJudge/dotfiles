-- https://github.com/nvim-treesitter/nvim-treesitter
local nvim_treesitter_config = require("nvim-treesitter.configs")

local config = {
	-- ensure_installed = "all",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		"query",
		"bash",
		"html",
		"http",
		"css",
		"cpp",
		"c",
		"go",
		"gomod",
		"ruby",
		"graphql",
		"java",
		"json",
		"php",
		"python",
		"rust",
		"typescript",
		"yaml",
		"regex",
		"javascript",
		"lua",
		"toml",
		"dockerfile",
		"vim",
		"sql",
		-- "svelte",
		-- "scss",
		-- "vue",
	},

	auto_install = false,

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			scope_incremental = "<S-CR>",
			node_decremental = "<BS>",
		},
	},

	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
	},

	-- PLUGINS

	-- nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},

	-- windwp/nvim-ts-autotag
	autopairs = {
		enable = true,
	},

	-- nvim-treesitter-refactor
	refactor = {
		highlight_definitions = {
			enable = true,
		},
	},

	-- nvim-ts-autotag
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"eruby",
			"javascript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
		},
	},
}

nvim_treesitter_config.setup(config)
