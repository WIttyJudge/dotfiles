local cmd = vim.cmd

-- Highlight like an error if more then 80 lines of code in one line.
-- match ErrorMsg '\%>80v.\+'

-- Restore cursor to where it was when the file was closed
cmd([[
  if !&diff
    autocmd BufLeave * let b:winview = winsaveview()
    autocmd BufEnter * if exists('b:winview') | call winrestview(b:winview) | endif
  endif
]])

-- remove trailing whitespace on save
-- cmd([[
--   autocmd BufWritePre * %s/\s\+$//e
--   autocmd InsertEnter * :set listchars-=trail:■
--   autocmd InsertLeave * :set listchars+=trail:■
-- ]])

local autocmds_list = {
  _general_settings = {
    -- Highlight yanked text
    { "TextYankPost", "*", "silent! lua vim.highlight.on_yank()" },

    -- " Make 'autoread' work more responsively
    -- { "BufEnter", "*", "silent! checktime" },
    -- { "CursorHold", "*", "silent! checktime" },
    -- { "CursorMoved", "*", "silent! checktime" },
    {"FocusGained", "* checktime"},

    -- Turn off line numbers in Terminal windows.
    -- { "TermOpen", "*", "setlocal nonumber | startinsert" }
  },
  _plugins = {
    -- vim-figutive
    { "FileType", "fugitive", "map <buffer> q gq<CR>" },
    -- vim-dadbod-completion
    {
      "FileType", "sql,mysql,plsql",
      ":lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })" 
    },
    -- packer
    { "BufWritePost", "plugins.lua", "PackerCompile" },
    {"BufWritePost", "*.sum, *.mod", ":silent :GoModTidy"}
  },
  _linter = {
    { "BufWritePre", "*.go", ":silent! lua require('go.format').goimport()" },
    -- { "BufWritePre", "*.go", ":silent! :lua require('custom.go.format').goimports(1000)" },
    -- { "BufWritePre", "*.go", ":silent! :lua vim.lsp.buf.formatting_sync(nil,500)" },
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
    },
    -- Source files
    {
      "BufWritePost", ".tmux.conf",
      "!tmux source-file %",
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

M.define_augroups(autocmds_list)

return M
