return {
	settings = {
		document_diagnostics = true,
		document_formatting = false,
		formatting_on_save = false,
	},
	options = {
		cmd = { "vim-language-server", "--stdio" },
		filetypes = { "vim" },
	},
}
