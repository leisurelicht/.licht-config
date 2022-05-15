-- =================
-- todo.lua --- todo comment
-- Author: MuCheng
-- =================
--
local ok, todo = pcall(require, "todo-comments")
if not ok then
	vim.notify("Load todo-comments Failed", "warn")
	return
end

todo.setup({})
