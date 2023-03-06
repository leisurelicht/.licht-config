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

outline.setup({ show_numbers = true })

--[[ local map = require("utils.mapping") ]]
--[[ map.set("n", "<leader>lo", "<CMD>SymbolsOutline<CR>", "Open Outline") ]]
--[[ map.set("n", "<leader>uo", "<CMD>SymbolsOutlineOpen<CR>", "Open") ]]
--[[ map.set("n", "<leader>uc", "<CMD>SymbolsOutlineClose<CR>", "Close") ]]

