-- =================
-- toggleterm.lua --- 浮窗终端
-- Author: MuCheng
-- =================
--
local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
	vim.notify("Load toggleterm Failed", "warn")
	return
end

toggleterm.setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local map = require("utils.mapping")
local api = require("utils.api")

map.set("n", "<C-T>", "<CMD>exe v:count1 . 'ToggleTerm'<CR>", "Term Toggle")
map.set("i", "<C-T>", "<ESC><CMD>exe v:count1 . 'ToggleTerm'<CR>", "Term Toggle")

function _G._Set_terminal_keymaps()
	-- keys.mapBufKey(0, "t", "<ESC>", [[<C-\><C-n>]])
	map.set("t", "<SPACE><ESC>", [[<C-\><C-n>]], "Esc", { buffer = 0 })
	map.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], "Up", { buffer = 0 })
	map.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], "Down", { buffer = 0 })
	map.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], "Left", { buffer = 0 })
	map.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], "Right", { buffer = 0 })
end

-- vim.cmd("autocmd TermOpen term://* lua _Set_terminal_keymaps()")
api.autocmd({ "TermOpen" }, {
	pattern = { "term://*" },
	command = "lua _Set_terminal_keymaps()",
})

function _SMART_ADD_TERM()
	local direction = require("toggleterm.ui").guess_direction()

	if vim.b.toggle_number == nil then
		vim.notify("Need Create First Term", "warn")
		return
	end

	if direction == nil then
		if vim.g._term_direction == 1 then
			-- vim.g._term_direction = 0
			direction = "vertical"
		elseif vim.g._term_direction == 2 then
			-- vim.g._term_direction = 0
			direction = "horizontal"
		elseif vim.g._term_direction == 0 then
			vim.notify("Can Not Add Term Window", "warn")
			return
		end
	end

	if direction == "vertical" then
		vim.cmd("exe b:toggle_number+1.'ToggleTerm direction=vertical'")
		vim.g._term_direction = 1
	elseif direction == "horizontal" then
		vim.cmd("exe b:toggle_number+1.'ToggleTerm direction=horizontal'")
		vim.g._term_direction = 2
	end
end

map.set("n", "<leader>of", "<CMD>ToggleTerm direction=float<CR>", "Toggle In Float")
map.set("n", "<leader>ot", "<CMD>ToggleTerm direction=tab<CR>", "Toggle In Tab")
map.set("n", "<leader>oh", "<CMD>ToggleTerm direction=horizontal<CR>", "Toggle In Horizontal")
map.set("n", "<leader>ov", "<CMD>ToggleTerm direction=vertical<CR>", "Toggle In Vertical")
map.set("n", "<leader>oa", "<CMD>lua _SMART_ADD_TERM()<CR>", "Add New Term")
map.set("n", "<leader>or", "<CMD>ToggleTermSendCurrentLine<CR>", "Send Current Line")

map.set("v", "<leader>or", "<CMD>ToggleTermSendVisualLines<CR>", "Send Visual Lines")
map.set("v", "<leader>os", "<CMD>ToggleTermSendVisualSelection<CR>", "Send Visual Selection")
