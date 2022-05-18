-- =================
-- go.lua --- go config file
-- Author: MuCheng
-- =================
--
local ok, go = pcall(require, "go")
if not ok then
	vim.notify("Load go Failed", "warn")
	return
end

go.setup({
	-- lsp_cfg = {
		-- capabilities = require("plugins.lsp.nvim-cmp").capabilities,
	-- },
})
