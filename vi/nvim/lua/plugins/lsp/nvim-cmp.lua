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

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<c-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s", "c" }),
		["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s", "c" }),
		["<c-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
		["<c-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
		["<TAB>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		["<CR>"] = cmp.mapping(cmp.mapping.confirm(), { "i", "s", "c" }),
		["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "s", "c" }),
		["<c-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "s", "c" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "cmp_tabnine" },
		{ name = "nvim_lua" },
		{
			name = "look",
			keyword_length = 2,
			option = {
				convert_case = true,
				loud = true,
			},
		},
		{ name = "tmux" },
		-- {name = "nvim_lsp_signature_help"}
	}, {
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmdline" },
		{ name = "fuzzy_buffer" },
		{ name = "spell" },
	}),
	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
		}),
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require("cmp-under-comparator").under,
			require("cmp_tabnine.compare"),
			require("cmp_fuzzy_buffer.compare"),
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.locality,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	formatting = {
		fields = {
			"abbr",
			"kind",
			"menu",
		},
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			before = function(entry, vim_item)
				vim_item.menu = (function()
					local m = ({
						nvim_lsp = "[LSP]",
						path = "[PATH]",
						buffer = "[BUF]",
						nvim_lua = "[LUA]",
						look = "[LK]",
						vsnip = "[VS]",
						spell = "[SPELL]",
						cmp_tabnine = "[TN]",
						cmdlime = "[CMD]",
						fuzzy_buffer = "[FUZZY]",
					})[entry.source.name]

					if m == nil then
						m = "<" .. string.upper(entry.source.name) .. ">"
					end

					return m
				end)()
				return vim_item
			end,
		}),
	},
})

-- -- Use buffer source for `/`.
cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })

-- -- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

-- -- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSUpport = true

local M = {}

M.capabilities = capabilities

return M
