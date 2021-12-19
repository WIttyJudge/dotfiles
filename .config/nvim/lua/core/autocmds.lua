local cmd = vim.cmd

-- Highlight like an error if more then 80 lines of code in one line.
-- match ErrorMsg '\%>80v.\+'

-- Restore cursor to where it was when the file was closed
cmd([[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

-- remove trailing whitespace on save
-- autocmd BufWritePre * %s/\s\+$//e

-- execute goimports linter
-- autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
-- autocmd BufWritePre *.go :silent! lua require('custom.go.format').goimports(1000)
-- autocmd BufWritePre *.go :silent! :Gofmt
-- autocmd BufWritePre (InsertLeave?) *.go <buffer> :silent! lua vim.lsp.buf.formatting_sync(nil,500)

local autogroups_list = {
  _general_settings = {
    -- Highlight yanked text
    { "TextYankPost", "*", "silent! lua vim.highlight.on_yank()" },

    { "CursorHold", "*", "checktime" }
  },
  _plugins = {
    { "FileType", "fugitive", "map <buffer> q gq<CR>" }
  },
  _linter = {
    -- { "BufWritePre", "*.go", ":silent! :GoImport" },
    -- { "BufWritePre", "*.go", ":silent! :GoFmt" },
    { "BufWritePre", "*.go", ":silent! :lua require('custom.go.format').goimports(1000)" },
    { "BufWritePre", "*.go", ":silent! :lua vim.lsp.buf.formatting_sync(nil,500)" },
    { "BufWritePre", "*.rs", ":FormatWrite" }
  },
  _autocompile = {
    -- Compile suckless-tools on save
    {
      "BufWritePost", "~/suckless-tools/dwmblocks/config.h",
      "!cd ~/suckless-tools/dwmblocks;",
      "sudo make clean install && { killall -q dwmblocks;setsid -f dwmblocks }"
    },  
    {
      "BufWritePost", "~/suckless-tools/dwm/config.h",
      "!cd ~/suckless-tools/dwm; sudo make clean install"
    }, 
    {
      "BufWritePost", '~/suckless-tools/dmenu/config.h',
      "!cd ~/suckless-tools/dmenu; sudo make clean install"
    }
  }
}

local M = {}

-- Create autocommand groups based on the passed definitions
 function M.define_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd "autocmd!"

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      vim.cmd(command)
    end

    vim.cmd "augroup END"
  end
end

M.define_augroups(autogroups_list)

return M
