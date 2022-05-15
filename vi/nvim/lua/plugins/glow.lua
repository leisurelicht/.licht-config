-- =================
-- glow.lua --- markdown 文件预览
-- Author: MuCheng
-- =================
--
vim.g.glow_binary_path = vim.env.HOME .. "/bin"
vim.g.glow_border = "rounded"
vim.g.glow_use_pager = true
vim.g.glow_style = "dark"

local wk = require("which-key")
wk.register({
	r = { name = "+Runner", m = { "<CMD>Glow<CR>", "markdown" } },
}, { prefix = "<leader>" })
