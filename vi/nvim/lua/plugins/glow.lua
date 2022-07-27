-- =================
-- glow.lua --- markdown 文件预览
-- Author: MuCheng
-- =================
--
local ok, glow = pcall(require, "glow")
if not ok then
    vim.notify("Load glow Failed", "warn")
    return
end

glow.setup({
    style = "dark",
    border = "rounded",
    pager = true,

})

local api = require("utils.api")

-- map.set("n", "<leader>rm", "<CMD>Glow<CR>", "markdown")
local runner = api.augroup("runner", { clear = true })
api.autocmd({ "FileType" }, {
	pattern = { "markdown" },
	callback = function()
        local map = require("utils.mapping")
	    map.set("n", "<leader>r", "<CMD>Glow<CR>", nil, {buffer = vim.fn.bufnr()})
	end,
	group = runner,
})
