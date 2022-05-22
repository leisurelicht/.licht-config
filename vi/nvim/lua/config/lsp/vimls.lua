return {
	settings = {
		document_diagnostics = true,
		document_formatting = true,
		formatting_on_save = true,
	},
	options = {
		cmd = { "vim-language-server", "--stdio" },
		filetypes = { "vim" },
	},
}
