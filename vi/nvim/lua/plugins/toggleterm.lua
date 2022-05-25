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

local keys = require("utils.keys")
keys.mapKey("n", "<C-T>", "<CMD>exe v:count1 . 'ToggleTerm'<CR>")
keys.mapKey("i", "<C-T>", "<ESC><CMD>exe v:count1 . 'ToggleTerm'<CR>")

function _G._set_terminal_keymaps()
	-- keys.mapBufKey(0, "t", "<ESC>", [[<C-\><C-n>]])
	keys.mapBufKey(0, "t", "<SPACE><ESC>", [[<C-\><C-n>]])
	keys.mapBufKey(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]])
	keys.mapBufKey(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]])
	keys.mapBufKey(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]])
	keys.mapBufKey(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]])
end

-- vim.cmd("autocmd TermOpen term://* lua _Set_terminal_keymaps()")
local api = require("utils.api")
api.autocmd({ "TermOpen" }, {
	pattern = { "term://*" },
	command = "lua _set_terminal_keymaps()",
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

local wk = require("which-key")
wk.register({
	o = {
		name = "+Term",
		-- t = {"<CMD>ToggleTerm<CR>", "Toggle"},
		f = { "<CMD>ToggleTerm direction=float<CR>", "Toggle In Float" },
		t = { "<CMD>ToggleTerm direction=tab<CR>", "Toggle In Tab" },
		h = { "<CMD>ToggleTerm direction=horizontal<CR>", "Toggle In Horizontal" },
		v = { "<CMD>ToggleTerm direction=vertical<CR>", "Toggle In Vertical" },
		a = { "<CMD>lua _SMART_ADD_TERM()<CR>", "Add New Term" },
		r = { "<CMD>ToggleTermSendCurrentLine<CR>", "Send Current Line" },
		c = {
			name = "+Call",
			h = { "<CMD>lua _HTOP_TOGGLE()<CR>", "Htop" },
		},
	},
}, { prefix = "<leader>" })
wk.register({
	o = {
		name = "+Term",
		r = { "<CMD>ToggleTermSendVisualLines<CR>", "Send Visual Lines" },
		s = { "<CMD>ToggleTermSendVisualSelection<CR>", "Send Visual Selection" },
	},
}, { mode = "v", prefix = "<leader>" })
