-- READ MORE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- Setup LSP for docker, yaml, typescript, ruby, golang, rust, bash, html, css
local servers = {
  dockerls = true,
  yamlls = true,
  rust_analyzer = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    settings = {
      ["rust-analyzer"] = {
        cargo =  { loadOutDirsFromCheck = true },
        procMacro =  { enable = true },
      }
    }
  },
  pyright = true,
  tsserver = {
    filetypes = {
      "javascript", "javascriptreact", "javascript.jsx", "typescript",
      "typescriptreact", "typescript.tsx"
    }
  },
  solargraph = { filetypes = { "ruby" } },
  gopls = {
    cmd = { "gopls", "serve" },
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      }
    }
  },
  bashls = {
    filetypes = { "sh" },
    cmd = { "bash-language-server", "start" },
  },
  html = {
    filetypes = { "html", "eruby" },
  },
  cssls = {
    settings = {
      css = { validate = true },
      less = { validate = true },
      scss = { validate = true }
    }
  }
}

return servers
