-- =================
-- comment-tree.lua --- 智能注释插件配置
-- Author: MuCheng
-- =================
--
local ok, comment = pcall(require, "Comment")
if not ok then
	vim.notify("Load comment Failed", "warn")
	return
end

comment.setup({
	toggler = {
		line = "gcc", -- 切换行注释
		block = "gCC", --- 切换块注释
	},
	opleader = {
		line = "gc", -- 可视模式下的行注释
		block = "gC", -- 可视模式下的块注释
	},
	extra = {
		above = "gcO", -- 在当前行上方新增行注释
		below = "gco", -- 在当前行下方新增行注释
		eol = "gcA", -- 在当前行行尾新增行注释
	},
	ignore = function()
		-- if vim.bo.filetype == "lua" then
		-- 	return "^$"
		-- end
	end,
	pre_hook = function(ctx)
		local u = require("Comment.utils")

		local location = nil
		if ctx.ctype == u.ctype.block then
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.cmotion == u.cmotion.v or ctx.cmotion == u.cmotion.V then
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = ctx.ctype == u.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})

-- 自定义不同类型文件的注释方式, 应该放到不同的语言配置文件中,使用详情见下方链接
-- https://github.com/numToStr/Comment.nvim#%EF%B8%8F-filetypes--languages
--
-- local ft_ok, ft = pcall(require, "Comment.ft")
-- if not ok then
--   print("require comment ft failed")
--   return
-- end

-- ft.set("raml", "#%s")
