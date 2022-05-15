-- =================
-- marks.lua --- marks config file
-- Author: MuCheng
-- =================
--
local ok, marks = pcall(require, "marks")
if not ok then
	vim.notify("Load marks Failed", "warn")
	return
end

marks.setup({})

local wk = require("which-key")
wk.register({
	m = {
		name = "+Marks",
		s = { "<Plug>(Marks-set)", "Set" },
		d = { "<Plug>(Marks-delete)", "Delete Buf" },
		r = { "<Plug>(Marks-delete-bookmark)", "Delete bookmark" },
		t = { "<CMD>MarksToggleSigns<CR>", "Toggle" },
		b = {
			name = "+Bookmarks",
			d = { "<Plug>(Marks-delete-bookmark)", "Delete" },
			n = { "<Plug>(Marks-next-bookmark)", "Next" },
			p = { "<Plug>(Marks-prev-bookmark)", "Previous" },
			s = { "<Plug>(Marks-set-bookmark[0-9])", "Set" },
			r = { "<Plug>(Marks-delete-bookmark[0-9])", "Remove" },
		},
		l = {
			name = "+List",
			a = { "<CMD>MarksListAll<CR>", "All" },
			b = { "<CMD>MarksListBuffer<CR>", "Buffer" },
			g = { "<CMD>MarksListGlobal<CR>", "Global" },
		},
		q = {
			name = "+Quickfix List",
			a = { "<CMD>MarksQFListAll<CR>", "All" },
			b = { "<CMD>MarksQFListBuf<CR>", "Buffer" },
			g = { "<CMD>MarksQFListGlocal<CR>", "Global" },
		},
	},
})
