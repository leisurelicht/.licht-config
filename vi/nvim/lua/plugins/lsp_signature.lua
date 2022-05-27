-- ==============
-- signature.lua --- 参数提示插件配置
-- Author: MuCheng
-- =================
--
local ok, signature = pcall(require, "lsp_signature")
if not ok then
	vim.notify("Load lsp_signature Failed", "warn")
	return
end

signature.setup({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
    floating_window = true,
	toggle_key = "<C-k>",
})
