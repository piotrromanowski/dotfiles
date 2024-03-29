local cmp = require'cmp'
--cmp.setup({
--    snippet = {
--      expand = function(args)
--        -- For `vsnip` user.
--        --vim.fn["vsnip#anonymous"](args.body)
--
--        -- For `luasnip` user.
--        require('luasnip').lsp_expand(args.body)
--
--        -- For `ultisnips` user.
--        -- vim.fn["UltiSnips#Anon"](args.body)
--      end,
--    },
--    mapping = {
--      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--      ['<C-f>'] = cmp.mapping.scroll_docs(4),
--      ['<C-Space>'] = cmp.mapping.complete(),
--      ['<C-e>'] = cmp.mapping.close(),
--      ['<CR>'] = cmp.mapping.confirm({ select = true }),
--    },
--    sources = {
--      { name = 'nvim_lsp' },
--      { name = 'nvim_lua' },
--
--      -- For vsnip user.
--      --{ name = 'vsnip' },
--
--      -- For luasnip user.
--      { name = 'luasnip' },
--
--      -- For ultisnips user.
--      -- { name = 'ultisnips' },
--
--      { name = 'buffer' },
--      { name = 'path' },
--  }
--})

-- luasnip setup
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'buffer' },
  },
}
