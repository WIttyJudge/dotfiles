-- https://github.com/neovim/nvim-lspconfig

-- Global configs
require('lsp/on_attach')

local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.cmd('sign define LspDiagnosticsSignError text=')
vim.cmd('sign define LspDiagnosticsSignWarning text=')
vim.cmd('sign define LspDiagnosticsSignInformation text=')
vim.cmd('sign define LspDiagnosticsSignHint text=')
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- css
nvim_lsp.cssls.setup { 
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
}

-- docker
nvim_lsp.dockerls.setup{}

-- html
nvim_lsp.html.setup {
  filetypes = { "html", "eruby"},
  capabilities = capabilities
}

-- json
nvim_lsp.jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}

-- ruby
nvim_lsp.solargraph.setup {}

-- svelte
nvim_lsp.svelte.setup{}

-- vim
nvim_lsp.vimls.setup{}

-- yaml
nvim_lsp.yamlls.setup{}

-- require("nvim-ale-diagnostic")
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     virtual_text = false,
--     signs = true,
--     update_in_insert = true,
--   }
-- )
