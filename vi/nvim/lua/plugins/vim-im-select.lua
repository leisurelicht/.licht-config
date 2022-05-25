-- =================
-- vim-im-select.lua --- 输入法自动切换
-- Author: MuCheng
-- =================
--
local sys = require("utils.sys")
local api = require("utils.api")
local map = require("utils.mapping")

vim.g.im_select_enable_focus_eventsF = 1
-- vim.g.im_select_default = "com.apple.keylayout.ABC"

if sys.IsMacOS() then
	api.autocmd({ "InsertLeave" }, {
		pattern = { "*" },
		command = "call system('im-select com.apple.keylayout.ABC')",
	})
	api.autocmd({ "CmdlineLeave" }, {
		pattern = { "*" },
		command = "call system('im-select com.apple.keylayout.ABC')",
	})
	api.autocmd({ "VimEnter" }, {
		pattern = { "*" },
		command = "call system('im-select com.apple.keylayout.ABC')",
	})
elseif sys.IsLinux() then
end

map.set("n", "<leader>ue", "<CMD>ImSelectEnable<CR>", "ImSelect Enable")
map.set("n", "<leader>uw", "<CMD>ImSelectDisable<CR>", "ImSelect Disable")
