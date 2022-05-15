-- =================
-- indent-blankline.lua --- indent-blankline
-- Author: MuCheng
-- =================
--
local ok, indent = pcall(require, "indent_blankline")
if not ok then
	vim.notify("Load indent-blankline Failed", "warn")
	return
end

indent.setup({
	show_current_context = true,
	show_current_context_start = true,
	context_patterns = {
		"class",
		"function",
		"method",
		"element",
		"^if",
		"^while",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
	},
	filetype_exclude = {
		"alpha",
		"packer",
		"terminal",
		"help",
		"log",
		"markdown",
		"TelescopePrompt",
		"lsp-installer",
		"toggleterm",
	},
})
