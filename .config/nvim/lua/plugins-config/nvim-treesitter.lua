-- https://github.com/nvim-treesitter/nvim-treesitter

local config = {
  -- ensure_installed = "all",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    "query", "bash", "html", "cpp", "c", "go", "gomod", "ruby", "svelte",
    "graphql", "java", "json", "php", "python", "rust", "typescript", "vue",
    "yaml", "regex", "javascript", "scss", "css", "lua", "toml", "dockerfile", "vim"
  },

  highlight = { enable = true, disable = {} },

  -- PLUGINS
  -- nvim-ts-rainbow
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
  },

  -- nvim-treesitter-refactor
  refactor = { highlight_definitions = { enable = true } },

  -- nvim-ts-autotag
  autotag = {
    enable = true,
    filetypes = {
      'html', 'eruby', 'javascript', 'javascriptreact', 'typescriptreact',
      'svelte', 'vue'
    }
  }
}

require'nvim-treesitter.configs'.setup(config)
