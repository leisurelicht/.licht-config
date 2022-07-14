-- =================
-- theme.lua --- theme config file
-- Author: MuCheng
-- =================
--
-- catppuccin
--
local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
if catppuccin_ok then
	vim.g.catppuccin_flavour = "macchiato"
	vim.g.background_transparency = true
	catppuccin.setup({
		-- 透明背景
		transparent_background = false,
		-- 使用终端背景色
		term_color = false,
		-- 代码样式
		styles = {
			comments = "italic",
			functions = "NONE",
			keywords = "NONE",
			strings = "NONE",
			variables = "NONE",
		},
		-- 为不同的插件统一样式风格
		-- 尽管这里有一些插件还没有安装，但是先将它们
		-- 设置为 true 并不影响
		integrations = {
			cmp = true,
			gitsigns = true,
			telescope = true,
			which_key = true,
			bufferline = true,
			markdown = true,
			ts_rainbow = true,
			hop = true,
			notify = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			nvimtree = {
				enabled = true,
				show_root = false,
				-- 透明背景
				transparent_panel = false,
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_saga = true,
		},
	})
end

-- nord
--
local nord_ok, nord = pcall(require, "node")
if nord_ok then
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = false
    vim.g.nord_italic = false
    nord.set()
end

-- nightfox
--
local nightfox_ok, nightfox = pcall(require, "nightfox")
if nightfox_ok then
	nightfox.setup({
		options = {
			styles = {
				comments = "italic",
				keywords = "bold",
				types = "italic,bold",
			},
		},
	})
end

-- vim.cmd([[colorscheme catppuccin]])
-- vim.cmd[[colorscheme nord]]
vim.cmd("colorscheme nightfox")

