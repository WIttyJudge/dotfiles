local utils = require("internal.utils")
local map = vim.keymap.set

local navic = require("nvim-navic")

function on_attach(client, bufnr)
  -- Plugins
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  -- Mappings

  map("n", "gd", function()
    -- require("telescope.builtin").lsp_definitions()
    Snacks.picker.lsp_definitions()
  end, { desc = "Goto Definition" })

  map("n", "gr", function()
    -- require("telescope.builtin").lsp_references()
    Snacks.picker.lsp_references()
  end, { desc = "References" })

  map("n", "gi", function()
    -- require("telescope.builtin").lsp_implementations()
    Snacks.picker.lsp_implementations()
  end, { desc = "Goto Implementation" })

  map("n", "gy", function()
    -- require("telescope.builtin").lsp_type_definitions()
    Snacks.picker.lsp_type_definitions()
  end, { desc = "Goto T[y]pe Definition" })

  map({ "n" }, "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

  map("n", "K", function()
    vim.lsp.buf.hover()
  end)

  map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
  map("n", "]d", utils.diagnostic_goto(true), { desc = "Next Diagnostic" })
  map("n", "[d", utils.diagnostic_goto(false), { desc = "Prev Diagnostic" })
  map("n", "]e", utils.diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
  map("n", "[e", utils.diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
  map("n", "]w", utils.diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
  map("n", "[w", utils.diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
end

return on_attach
