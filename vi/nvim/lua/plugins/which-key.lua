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
	b = { name = "+Buffer" },
    r = { name = "+Runner" },
	w = { name = "+Window" },
	s = { name = "+String" },
	t = {
		name = "+Tab",
		o = { name = "+Close Only" },
	},
	u = { name = "+Utils" },
}, { mode = "n", prefix = "<leader>" })

wk.register({
}, { mode = "n", prefix = "<localleader>" })
