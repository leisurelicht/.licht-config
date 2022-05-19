local packer = require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
    }


    use "hrsh7th/nvim-cmp"

    use({
        "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
        "hrsh7th/cmp-buffer", -- { name = 'buffer' },
        -- vsnip 代码片段补全
        "hrsh7th/cmp-vsnip", -- { name = 'vsnip' }
        "hrsh7th/vim-vsnip", -- VSCode(LSP)'s snippet feature in vim
			  "rafamadriz/friendly-snippets", -- 代码片段
        after = { "nvim-cmp" },
    })

end)

vim.o.completeopt="menu,menuone,noselect"

require("nvim-lsp-installer").setup {
  automatic_installation = true
}

local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer" },
	}),
  mapping = {
		["<c-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s", "c" }),
		["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s", "c" }),
		["<c-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
		["<c-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
		["<TAB>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
		["<CR>"] = cmp.mapping(cmp.mapping.confirm(), { "i", "s", "c" }),
		["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "s", "c" }),
		["<c-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "s", "c" }),
	},
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'sumneko_lua', 'gopls' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup ({
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        vim.o.completeopt="menu,menuone,noselect"
    end
  })
end


return packer
