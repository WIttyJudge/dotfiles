local M = {}

-- Bind keymap
function M.map(mode, keys, command, opts)
	local default_options = { silent = true }
	-- merge default + user opts
	local options = vim.tbl_extend("force", default_options, opts or {})

	if type(keys) == "table" then
		for _, keymap in ipairs(keys) do
			M.map(mode, keymap, command, options)
		end
		return
	end

	vim.keymap.set(mode, keys, command, opts)
end

-- Delete keymap
function M.unmap(mode, lhs)
	return vim.api.nvim_del_keymap(mode, lhs)
end

-- Get home dir ($HOME)
function M.get_homedir()
	return os.getenv("HOME")
end

local diagnostics_enabled = true
function M.toggle_diagnostics()
	diagnostics_enabled = not diagnostics_enabled
	if diagnostics_enabled then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end

return M
