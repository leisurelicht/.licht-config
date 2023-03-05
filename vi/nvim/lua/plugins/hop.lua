-- =================
-- hop.lua 
-- Note:快速跳转插件配置
-- Author: MuCheng
-- Link: https://github.com/phaazon/hop.nvim
-- =================
--
local ok, hop = pcall(require, "hop")
if not ok then
	vim.notify("Load hop Failed", "warn")
	return
end

hop.setup()

local map = require("utils.mapping")

map.set(
	"n",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    "Jump Forward"
)
map.set(
	"n",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	"Jump BackWard"
)
map.set(
	"o",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    "Jump Forward"
)
map.set(
	"o",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
	"Jump BackWard"
)
map.set(
	"",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
    "Jump Forward"
)
map.set(
	"",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
	"Jump BackWard"
)
map.set("n", "<leader>hw","<CMD>HopWord<CR>", "Word" )
map.set("n", "<leader>hl", "<CMD>HopLine<CR>", "Line")
map.set("n", "<leader>hc", "<CMD>HopChar1<CR>", "Char")
map.set("n", "<leader>hp", "<CMD>HopPattern<CR>", "Pattern")
map.set("n", "<leader>hs", "<CMD>HopLineStart<CR>", "Line Start")
map.set("n", "<leader>haw", "<CMD>HopWordMW<CR>", "Word")
map.set("n", "<leader>hal", "<CMD>HopLineMW<CR>", "Line")
map.set("n", "<leader>hac", "<CMD>HopChar1MW<CR>", "Char")
map.set("n", "<leader>hap", "<CMD>HopPatternMW<CR>", "Pattern")
map.set("n", "<leader>has", "<CMD>HopLineStartMW<CR>", "Line Start")

