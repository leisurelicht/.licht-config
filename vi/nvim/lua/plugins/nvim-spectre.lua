-- =================
-- nvim-spectre.lua --- spectre config file
-- Author: MuCheng
-- =================
--

local ok, spectre = pcall(require, "spectre")
if not ok then
	vim.notify("Load spectre Failed", "warn")
	return
end

spectre.setup({})

local wk = require("which-key")
wk.register({
	r = {
		name = "+Spectre",
		o = { "<CMD>lua require('spectre').open()<CR>", "Open" },
		p = { "viw:lua require('spectre').open_file_search()<cr>", "File" },
		w = { "<CMD>lua require('spectre').open_visual({select_word=true})<CR>", "Word" },
	},
}, { prefix = "<leader>" })
