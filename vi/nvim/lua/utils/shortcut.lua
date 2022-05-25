-- =================
-- shortcut.lua --- 自定义快捷方法
-- Author: MuCheng
-- =================
--
local ok, terminal = pcall(require, "toggleterm.terminal")
if not ok then
    vim.notify("Load Terminal Failed", "warn")
    return
end

local Terminal = terminal.Terminal

local map = require("utils.mapping")

M = {}

local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		map.set( "n", "q", "<CMD>close<CR>", "Close Lazygit", { buffer = term.bufnr, silent = true })
	end,
	-- function to run on closing the terminal
	-- on_close = function(term)
	--   vim.cmd("Closing terminal")
	-- end
})

function M._Lazygit()
	lazygit:toggle({})
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function M._Htop()
	htop:toggle({})
end


-- map.set("n", "<leader>nh", function() M._Htop() end, "Htop")

return M
