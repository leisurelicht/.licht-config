-- ==============
-- nvim-cmp.lua --- 代码补全框架
-- Author: MuCheng
-- =================
--
local ok, cmp = pcall(require, "cmp")
if not ok then
  vim.notify("Load nvim-cmp Failed", "warn")
  return
end

local lspkind_ok, lspkind = pcall(require, "lspkind")
if not lspkind_ok then
  vim.notify("Load lspkind Failed", "warn")
  return
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
  vim.notify("Load cmp_nvim_lsp Failed", "warn")
  return
end

cmp.setup {
  snippet = {expand = function(args) vim.fn["vsnip#anonymous"](args.body) end},
  mapping = {
    ['<C-v>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-y>'] = cmp.config.disable,
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<TAB>'] = cmp.mapping.select_next_item(),

    ['<C-e>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-c>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()})
  },
  sources = cmp.config.sources({
    {name = 'nvim_lsp'}, {name = 'vsnip'}
  }, {
    {name = 'buffer'}, {name = 'path'}, {name = 'cmdline'}
  }),
  formatting = {
    fields = {
      'abbr', 'kind', 'menu'
    },
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          path = "[PATH]",
          buffer = "[BUFFER]",
          nvim_lua = "[LUA]",
          look = "[look]"
        })[entry.source.name]

        -- local types = require("cmp.types")
        -- local str = require("cmp.utils.str")
        --
        -- local word = entry:get_insert_text()
				-- if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
				-- 	word = vim.lsp.util.parse_snippet(word)
				-- end
				-- word = str.oneline(word)

				-- if
				-- 	entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
				-- 	and string.sub(vim_item.abbr, -1, -1) == "~"
				-- then
				-- 	word = word .. "~"
				-- end
				-- vim_item.abbr = word

        return vim_item
      end
    })
  }
}

-- -- Use buffer source for `/`.
-- cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- -- Use cmdline & path source for ':'.
-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
-- })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return capabilities
