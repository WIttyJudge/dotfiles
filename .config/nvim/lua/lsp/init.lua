-- https://github.com/neovim/nvim-lspconfig

-- Global configs
local on_attach = require('lsp/on_attach')

local icons = require('custom.icons')

local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.cmd('sign define LspDiagnosticsSignError text=' .. icons.diagnostic.error)
vim.cmd('sign define LspDiagnosticsSignWarning text=' .. icons.diagnostic.warn)
vim.cmd('sign define LspDiagnosticsSignHint text=' .. icons.diagnostic.hint)
vim.cmd('sign define LspDiagnosticsSignInformation text=' .. icons.diagnostic.info)

--Enable completion triggered by <c-x><c-o>
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- typescript
nvim_lsp.tsserver.setup {
  filetypes = { 
    "javascript", "javascriptreact", "javascript.jsx", "typescript", 
    "typescriptreact", "typescript.tsx" 
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end
}

-- ruby
nvim_lsp.solargraph.setup {
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  settings = {
    solargraph = {
      formatting = true
    }
  },
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end
}

-- golang
nvim_lsp.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end
}

-- bash
nvim_lsp.bashls.setup {
  filetypes = { "sh" },
  cmd = { "bash-language-server", "start" },
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end
}

-- vim
nvim_lsp.vimls.setup {}

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
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end
}

-- docker
nvim_lsp.dockerls.setup {
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end,
}

-- html
nvim_lsp.html.setup {
  filetypes = { "html", "eruby"},
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end,
}

-- yaml
nvim_lsp.yamlls.setup {
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end,
}

-- sql
-- nvim_lsp.sqlls.setup {
--   filetypes = { "sql", "mysql" },
--   cmd = {"sql-language-server", "up", "--method", "stdio"};
--   on_attach = function(client, bufnr)
--     on_attach.on_attach()
--   end,
-- }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,

    -- Disable virtual_text on file load
    -- Show with vim.lsp.diagnostic.show_line_diagnostics()
    -- I'm using nvim-echo-diagnostic plugin
    virtual_text = false,
    -- virtual_text = {
    --   prefix = "",
    --   spacing = 0,
    -- },

    signs = true,
    update_in_insert = true,
  }
)
