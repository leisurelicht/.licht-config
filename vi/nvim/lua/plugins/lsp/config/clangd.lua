return {
	settings = {
		document_diagnostics = false,
		document_formatting = true,
		formatting_on_save = true,
	},
	options = {
		root_dir = function()
			return vim.fn.getcwd()
		end,
	},
}
