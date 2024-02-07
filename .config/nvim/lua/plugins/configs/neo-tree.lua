-- https://github.com/nvim-neo-tree/neo-tree.nvim
local neotree = require("neo-tree")
local icons = require("internal.icons")

local config = {
	-- auto_clean_after_session_restore = true,
	close_if_last_window = true,
	enable_diagnostics = false,
	enable_modified_markers = false,

	filesystem = {
		-- follow_current_file = { enabled = false },
		use_libuv_file_watcher = true,
		filtered_items = {
			-- visible = true,
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},

	commands = {
		parent_or_close = function(state)
			local node = state.tree:get_node()
			if (node.type == "directory" or node:has_children()) and node:is_expanded() then
				state.commands.toggle_node(state)
			else
				require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
			end
		end,
		child_or_open = function(state)
			local node = state.tree:get_node()
			if node.type == "directory" or node:has_children() then
				if not node:is_expanded() then -- if unexpanded, expand
					state.commands.toggle_node(state)
				else -- if expanded and has children, seleect the next child
					require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
				end
			else -- if not a directory just open it
				state.commands.open(state)
			end
		end,
		find_in_dir = function(state)
			local node = state.tree:get_node()
			local path = node:get_id()
			require("telescope.builtin").find_files({
				cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
			})
		end,
	},

	window = {
		width = 30,
		mappings = {
			["<space>"] = false, -- disable space until we figure out which-key disabling
			["[b"] = "prev_source",
			["]b"] = "next_source",
			F = "find_in_dir",
			-- ["O"] = "system_open",
			-- ["Y"] = "copy_selector",
			["h"] = "parent_or_close",
			["l"] = "child_or_open",
			["<enter>"] = "set_root",
		},
		fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
			["<C-j>"] = "move_cursor_down",
			["<C-k>"] = "move_cursor_up",
		},
	},

	default_component_configs = {
		indent = { padding = 0 },
		icon = {
			folder_closed = icons.folder.Closed,
			folder_open = icons.folder.Opened,
			folder_empty = icons.folder.Empty,
			folder_empty_open = icons.folder.Empty,
			default = icons.DefaultFile,
		},
		git_status = {
			symbols = {
				added = icons.git.Add,
				deleted = icons.git.Deleted,
				modified = icons.git.Add,
				renamed = icons.git.Renamed,
				untracked = icons.git.Untracked,
				ignored = icons.git.Ignored,
				unstaged = icons.git.Unstaged,
				staged = icons.git.Staged,
				conflict = icons.git.Conflict,
			},
		},
	},

	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function(_)
				vim.opt_local.signcolumn = "auto"
			end,
		},
	},
}

neotree.setup(config)
