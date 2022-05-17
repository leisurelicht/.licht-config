local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
	settings = {
		document_diagnostics = true,
		document_formatting = true,
		formatting_on_save = false,
	},
	options = {
		-- cmd = { "lua-language-server", "--locale=zh-CN" },
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		log_level = 2,
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
