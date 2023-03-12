-- local wk = require("which-key")
local util = require("lspconfig.util")

return {
	settings = {
		document_diagnostics = true,
		document_formatting = true,
		formatting_on_save = false,
	},
	-- attach = function(_, bufnr)
		-- wk.register({
		-- 	y = {
		-- 		name = "+Golang",
		-- 		a = { "<CMD>GoCodeAction<CR>", "Action" },
		-- 		t = {
		-- 			name = "+Tag",
		-- 			a = { "<CMD>GoAddTag<CR>", "Add Tag" },
		-- 			r = { "<CMD>GoRmTag<CR>", "Rm Tag" },
		-- 			c = { "<CMD>GoClearTag<CR>", "Clear Tag" },
		-- 		},
		-- 		c = { "<CMD>GoCmt<CR>", "Add Comment" },
		-- 		f = { "<CMD>GoFmt<CR>", "Format" },
		--
		-- 		m = { "<CMD>GoModTidy<CR>", "Go Mod Tidy" },
		-- 	},
		-- }, { prefix = "<leader>", buffer = bufnr })
	-- end,
	options = {
		cmd = { "gopls" },
		single_file_support = true,
		filetypes = { "go", "gomod", "gotmpl" },
		root_dir = function(fname)
			return util.root_pattern("go.work")(fname) or util.root_pattern("go.mod", ".git")(fname)
		end,
	},
}
