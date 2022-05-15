local api = require("utils.api")
return {
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr)
			-- disable gopls format
			client.resolved_capabilities.document_formatting = false
			api.autocmd({ "BufWritePre" }, {
				pattern = { "<buffer>" },
				command = "lua vim.lsp.buf.formatting_sync()",
			})
		end,
	},
	options = {
		root_dir = function()
			return vim.fn.getcwd()
		end,
		handlers = {
			---@diagnostic disable-next-line: unused-vararg
			["textDocument/publishDiagnostics"] = function(...) end,
		},
	},
}
