return {
	settings = {
		document_diagnostics = true,
		document_formatting = false,
		formatting_on_save = true,
	},
	options = {
		root_dir = function()
			return vim.fn.getcwd()
		end,
	},
}
