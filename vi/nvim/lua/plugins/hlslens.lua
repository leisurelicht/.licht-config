-- =================
-- hlslens.lua --- 搜索结果统计插件配置
-- Author: MuCheng
-- =================
--
local ok, hlslens = pcall(require, "hlslens")
if not ok then
	vim.notify("Load hlslens Failed", "warn")
	return
end

hlslens.setup({})

local map = require("utils.mapping")

map.set(
	"n",
	"n",
	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	"Next Hlslens"
)
map.set(
	"n",
	"N",
	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	"Previous Hlslens"
)
map.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], "Forward Search")
map.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], "Backward Search")
map.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], "Weak Forward Search")
map.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], "Weak Backward Search")
