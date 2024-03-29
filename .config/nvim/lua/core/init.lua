-- disable some default providers
local function disable_default_providers()
	local providers = {
		"node",
		"perl",
		"python3",
		"ruby",
	}

	for _, provider in ipairs(providers) do
		vim.g["loaded_" .. provider .. "_provider"] = 0
	end
end

local function load_modules()
	local core_modules = {
		"core.options",
		"core.plugin_manager",
		"core.commands",
		"core.autocmds",
		"core.mappings",
	}

	for _, module in ipairs(core_modules) do
		local ok, err = pcall(require, module)
		if not ok then
			print("Error loading " .. module .. "\n\n" .. err)
		end
	end
end

local M = {}

function M.load()
	disable_default_providers()

	load_modules()
end

return M
