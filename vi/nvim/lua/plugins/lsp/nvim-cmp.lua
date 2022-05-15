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
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = cmp.mapping.preset.insert(
        {
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            -- ["<C-k>"] = cmp.mapping.select_prev_item(),
            -- ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<TAB>"] = cmp.mapping.select_next_item(),
            ["<CR>"] = cmp.mapping.confirm({select = false}),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort()
        }
    ),
    sources = cmp.config.sources(
        {
            {name = "nvim_lsp"},
            {name = "vsnip"},
            {name = "tmux"},
            {name = "cmp_tabnine"},
            {name = "nvim_lua"},
            {name = "buffer"},
            {name = "path"},
            {name = "cmdline"},
            {name = "spell"},
            {
                name = "look",
                keyword_length = 2,
                option = {
                    convert_case = true,
                    loud = true
                }
            }
            -- {name = "nvim_lsp_signature_help"}
        }
    ),
    window = {
        completion = cmp.config.window.bordered(
            {
                winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"
            }
        ),
        documentation = cmp.config.window.bordered(
            {
                winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"
            }
        )
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            require("cmp-under-comparator").under,
            require("cmp_tabnine.compare"),
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order
        }
    },
    formatting = {
        fields = {
            "abbr",
            "kind",
            "menu"
        },
        format = lspkind.cmp_format(
            {
                mode = "symbol_text",
                maxwidth = 50,
                before = function(entry, vim_item)
                    vim_item.menu =
                        (function()
                        local m =
                            ({
                            nvim_lsp = "[LSP]",
                            path = "[PATH]",
                            buffer = "[BUF]",
                            nvim_lua = "[LUA]",
                            look = "[LK]",
                            vsnip = "[VS]",
                            spell = "[SPELL]",
                            cmp_tabnine = "[TN]",
                            cmdlime = "[CMD]"
                        })[entry.source.name]

                        if m == nil then
                            m = "<" .. string.upper(entry.source.name) .. ">"
                        end

                        return m
                    end)()
                    return vim_item
                end
            }
        )
    }
}

-- -- Use buffer source for `/`.
cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})

-- -- Use cmdline & path source for ':'.
cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})
    }
)

-- -- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSUpport = true

local M = {}

M.capabilities = capabilities

return M
