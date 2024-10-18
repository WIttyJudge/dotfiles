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

-- Get home dir ($HOME)
function M.get_homedir()
	return os.getenv("HOME")
end

return M
