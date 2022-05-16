return {
	settings = {
		document_diagnostics = false,
		document_formatting = false,
		formatting_on_save = true,
	},
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr) end,
	},
	options = {
		root_dir = function()
			return vim.fn.getcwd()
		end,
		handlers = {},
	},
}
