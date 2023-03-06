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
	["["] = { name = "+Previous" },
	["]"] = { name = "+Next" },
	b = {
		name = "+Buffer Manage",
		-- c = { name = "+Close" },
		-- s = { name = "+Sort" },
	},
	f = {
		name = "+Find",
		h = { name = "+History" },
		g = { name = "+Git" },
	},
	F = { name = "+FileTree" },
	h = {
		name = "+Hop",
		a = { name = "+All Windows" },
	},
	g = { name = "+Git" },
	l = {
		name = "+LSP",
		w = { name = "+WorkSpace" },
		s = { name = "+Synbols" },
	},
	o = { name = "+Term" },
	P = { name = "+Plugin Manage" },
	r = { name = "+Runner" },
	s = { name = "+Window Split" },
	t = {
		name = "+Tab Manage",
		o = { name = "+Close Only" },
	},
	T = {
		name = "+Treesitter",
		n = { "代码选择" },
		r = { "递增" },
		c = { "递减" },
		m = { "块递增" },
	},
	u = { name = "+Utils" },
}, { mode = "n", prefix = "<leader>" })

wk.register({
	g = { name = "+Git" },
	l = { name = "+LSP" },
	o = { name = "+Term" },
	s = { name = "+Shift String" },
	T = {
		name = "+Treesitter",
		n = { "代码选择" },
		r = { "递增" },
		c = { "递减" },
		m = { "块递增" },
	},
}, { mode = "v", prefix = "<leader>" })

wk.register({
	s = { name = "+Shift String" },
}, { mode = "n", prefix = "<localleader>" })
