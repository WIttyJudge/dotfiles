local M = {
	go = { "go run ", "go test " },
	rust = { "cargo run " },
	rb = { "ruby " },
	sh = { "bash " },
}

function M.run_command()
	local cmd = nil
	local file_name = vim.fn.expand("%:p")
	local file_type = vim.fn.expand("%:e")

	if vim.bo.filetype == "dashboard" then
		return
	end
	if vim.bo.filetype == "NvimTree" then
		return
	end

	if M[file_type] == nil then
		vim.notify("There is no runner for " .. file_type .. " filetype", vim.log.levels.WARN)
		return
	end

	local runner = M[file_type]
	cmd = runner[1]

	if file_type == "go" then
		if file_name:match("_test") then
			cmd = runner[2]
		end
	end

	local output_list = vim.fn.split(vim.fn.system(cmd .. file_name), "\n")
	for _, v in ipairs(output_list) do
		print(v)
	end
end

return M
