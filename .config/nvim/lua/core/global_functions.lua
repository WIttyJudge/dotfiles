-- convert word to Snake case
function _G.Snake(s)
	if s == nil then
		s = vim.fn.expand("<cword>")
	end
	print("replace: ", s)
	local n =
		s:gsub("%f[^%l]%u", "_%1"):gsub("%f[^%a]%d", "_%1"):gsub("%f[^%d]%a", "_%1"):gsub("(%u)(%u%l)", "%1_%2"):lower()
	vim.fn.setreg("s", n)
	vim.cmd([[exe "norm! ciw\<C-R>s"]])
	print("newstr", n)
end

-- convert to camel case
function _G.Camel(asdas)
	local s
	if s == nil then
		s = vim.fn.expand("<cword>")
	end
	local n = string.gsub(s, "_%a+", function(word)
		local first = string.sub(word, 2, 2)
		local rest = string.sub(word, 3)
		return string.upper(first) .. rest
	end)
	vim.fn.setreg("s", n)
	vim.cmd([[exe "norm! ciw\<C-R>s"]])
	print("newstr", n)
end

-- reformat file by remove \n\t and pretty if it is json
function _G.Format(json)
	pcall(vim.cmd, [[%s/\\n/\r/g]])
	pcall(vim.cmd, [[%s/\\t/  /g]])
	pcall(vim.cmd, [[%s/\\"/"/g]])

	-- again
	vim.cmd([[nohl]])
	-- for json run

	if json then
		vim.cmd([[Jsonformat]]) -- :%!jq .
	end
end
