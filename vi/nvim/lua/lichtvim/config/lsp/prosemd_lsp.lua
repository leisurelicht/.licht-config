local lsp_util = require("lspconfig.util")

return {
	settings = {
		document_diagnostics = true,
		document_formatting = true,
		formatting_on_save = true,
	},
	options = {
		cmd = { "prosemd-lsp", "--stdio" },
		filetypes = { "markdown" },
		-- root_dir = function(fname)
		-- 	return lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
		-- end,
		settings = {},
	},
}
