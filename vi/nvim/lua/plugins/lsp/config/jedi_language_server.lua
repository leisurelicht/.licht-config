return {
	settings = {
		document_diagnostics = false,
		document_formatting = false,
		formatting_on_save = false,
	},
	options = {
		root_dir = function()
			return vim.fn.getcwd()
		end,
		handlers = {},
	},
}
