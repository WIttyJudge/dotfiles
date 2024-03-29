local cmd = vim.api.nvim_create_user_command

cmd("RunCommand", function()
	require("internal.quickrun").run_command()
end, { desc = "Execute files" })

-- conform.nvim
cmd("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

-- gitsigns.nvim
cmd("GitBlameByLineToggle", "Gitsigns toggle_current_line_blame", { desc = "Toggle Git blame" })

-- nvim-spectre
cmd("SpectreOpen", function()
	require("spectre").open()
end, { desc = "nvim-spectre plugin" })

-- comment-box.nvim
cmd("CommentBox", "CBcbox10", { desc = "comment-box plugin" })

-- global-note.nvim
cmd("ProjectNote", function ()
	require('global-note').toggle_note('project_local')
end, { desc = "Note taker per project" })
