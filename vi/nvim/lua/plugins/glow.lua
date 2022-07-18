-- =================
-- glow.lua --- markdown 文件预览
-- Author: MuCheng
-- =================
--
vim.g.glow_border = "rounded"
vim.g.glow_use_pager = true
vim.g.glow_style = "dark"

local map = require("utils.mapping")

map.set("n", "<leader>rm", "<CMD>Glow<CR>", "markdown")
