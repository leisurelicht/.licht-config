-- =================
-- which-key.lua --- which-key config file
-- author: mucheng
-- =================
--
local ok, wk = pcall(require, "which-key")
if not ok then
	vim.notify("Load which-key Failed", "warn")
	return
end

wk.setup({
	layout = { height = { min = 4, max = 20 }, align = "center" },
	icons = { breadcrumb = "»", separator = "➜", group = "+" },
})

wk.register({
	["w!"] = { name = "+Mandatory Save" },
}, { mode = "c" })

wk.register({
	s = { name = "+Window Split" },
	t = {
		name = "+Tab Manager",
		o = { name = "+Close Only" },
	},
}, { prefix = "<leader>" })

wk.register({
	s = { name = "+Shift String" },
}, { mode = "v", prefix = "<leader>" })

wk.register({
	s = { name = "+Shift String" },
}, { mode = "n", prefix = "<localleader>" })
