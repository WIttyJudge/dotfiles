local M = {}

local map = require("internal.utils").map

function M.on_attach()
  map("n", "gd", function()
    vim.lsp.buf.definition()
  end)

  map("n", "gr", function()
    require("telescope.builtin").lsp_references()
  end)

  map("n", "K", function()
    vim.lsp.buf.hover()
  end)

  map("n", "<Leader>ar", function()
    vim.lsp.buf.rename()
  end)

  map("n", "<Leader>ee", function()
    vim.diagnostic.open_float()
  end)

  map("n", "<Leader>ej", function()
    vim.diagnostic.goto_next()
  end)

  map("n", "<Leader>ek", function()
    vim.diagnostic.goto_prev()
  end)
end

return M
