-- https://github.com/hrsh7th/nvim-cmp

local cmp_present, cmp = pcall(require, "cmp")
local lspkind_present, lspkind = pcall(require, "lspkind")

if not cmp_present and not lspkind_present then
  return
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local config = {
  snippet = {
    expand = function(args)
      --vim.fn["vsnip#anonymous"](args.body)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-o>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ["<C-space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        --elseif has_words_before() then
        --   cmp.complete()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end,

    --     ["<Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --           cmp.select_next_item()
    --         elseif has_words_before() then
    --           cmp.complete()
    --         else
    --           -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    --           fallback()
    --         end
    --     end, {"i", "s"}),

    --     ["<S-Tab>"] = cmp.mapping(function()
    --         if cmp.visible() then
    --             cmp.select_prev_item()
    --         elseif vim.fn["vsnip#jumpable"](-1) == 1 then
    --             feedkey("<Plug>(vsnip-jump-prev)", "")
    --         end
    --     end, {"i", "s"})
  },
  window = {
    documentation = {
      border = "rounded",
    },
  },
  experimental = {
    ghost_text = false,
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "path" },
    --{ name = 'vsnip' },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 4 },
    { name = "nvim_lsp_signature_help" },
    -- { name = 'emoji' }
  },
  formatting = {
    format = lspkind.cmp_format {
      mode = "symbol_text",
      symbol_text = require("internal/icons").kind,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        vsnip = "[Snippet]",
        -- emoji = "[Emoji]"
      },
    },
  },
  preselect = false,
}

cmp.setup(config)

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- Expand or jump snippets
vim.cmd [[
imap <silent><expr> <C-l> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-l>' 

"imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
]]
