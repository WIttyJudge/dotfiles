-- https://github.com/hrsh7th/nvim-cmp
-- hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-path

vim.cmd([[
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
]])

local cmp = require('cmp')

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local config = {
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-o>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          fallback() 
        end
    end, {"i", "s"}),

    ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
            cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
        end
    end, {"i", "s"})
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    -- For vsnip user.
    { name = 'vsnip' },
    { name = 'buffer', keyword_length = 5 }
  },
  formatting = {
    format = function(entry, vim_item) -- fancy icons and a name of kind
      local lspkind_config = require('plugins-config/lspkind-nvim').config
      vim_item.kind = lspkind_config.symbol_map[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[path]",
        vsnip = "[snip]"
      })[entry.source.name]
      return vim_item
    end,
  },
}

cmp.setup(config)

-- Expand or jump snippets
vim.cmd([[
imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
]])
