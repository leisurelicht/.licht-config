return {
	settings = {
		document_diagnostics = true,
		document_formatting = true,
		formatting_on_save = true,
	},
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr) end,
	},
	options = {
		cmd = { "vim-language-server", "--stdio" },
		filetypes = { "vim" },
	},
}
