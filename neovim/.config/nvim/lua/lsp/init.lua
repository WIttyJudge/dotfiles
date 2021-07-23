-- https://github.com/neovim/nvim-lspconfig

-- Global configs
local on_attach = require('lsp/on_attach')

local icons = require('custom.icons')

local nvim_lsp = require('lspconfig')
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.cmd('sign define LspDiagnosticsSignError text=' .. icons.diagnostic.error)
vim.cmd('sign define LspDiagnosticsSignWarning text=' .. icons.diagnostic.warn)
vim.cmd('sign define LspDiagnosticsSignHint text=' .. icons.diagnostic.hint)
vim.cmd('sign define LspDiagnosticsSignInformation text=' .. icons.diagnostic.info)
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

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
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end,
  capabilities = capabilities
}

-- ruby
nvim_lsp.solargraph.setup {
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end,
  settings = {
    solargraph = {
      formatting = true
    }
  }
}

-- vim
nvim_lsp.vimls.setup{}

-- golang
nvim_lsp.gopls.setup {
  cmd = {"gopls", "serve"},
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- yaml
nvim_lsp.yamlls.setup{
  on_attach = function(client, bufnr)
    on_attach.on_attach()
  end,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,

    -- Disable virtual_text on file load
    -- Show with vim.lsp.diagnostic.show_line_diagnostics()
    -- I'm using nvim-echo-diagnostic plugin
    virtual_text = true,
    -- virtual_text = {
    --   prefix = "",
    --   spacing = 0,
    -- },

    signs = true,
    update_in_insert = true,
  }
)
