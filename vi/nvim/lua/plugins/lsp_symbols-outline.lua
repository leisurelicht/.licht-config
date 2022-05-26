-- =================
-- symbols-outline.lua --- 代码结构树配置文件
-- Author: MuCheng
-- =================
--
local ok, outline = pcall(require, "symbols-outline")
if not ok then
	vim.notify("Load symbols-outline Failed", "warn")
	return
end

outline.setup({ show_numbers = false })

local map = require("utils.mapping")

map.set("n", "<F5>", "SymbolsOutline", "SymbolsOutline")

map.set("n", "<F5>", "<CMD>SymbolsOutline<CR>", "Symbols Toggle")
map.set("n", "<leader>St", "<CMD>SymbolsOutline<CR>", "Toggle")
map.set("n", "<leader>So", "<CMD>SymbolsOutlineOpen<CR>", "Open")
map.set("n", "<leader>Sc", "<CMD>SymbolsOutlineClose<CR>", "Close")
