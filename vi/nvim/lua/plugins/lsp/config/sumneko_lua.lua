local api = require("utils.api")
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
	settings = {
		document_diagnostics = true,
		document_formatting = false,
		formatting_on_save = true,
	},
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr)
			api.autocmd({ "BufWritePre" }, {
				pattern = { "<buffer>" },
				command = "lua vim.lsp.buf.formatting_sync()",
			})
		end,
	},
	options = {
		-- cmd = { "lua-language-server", "--locale=zh-CN" },
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		log_level = 2,
		root_dir = function()
			return vim.fn.getcwd()
		end,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = runtime_path,
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
}
