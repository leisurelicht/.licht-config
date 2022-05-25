-- =================
-- spectre.lua --- 搜索替换
-- Author: MuCheng
-- =================
--
local ok, spectre = pcall(require, "spectre")
if not ok then
    vim.notify("Load spectre Failed", "warn")
    return
end

spectre.setup({

})

local map = require("utils.mapping")
map.set("n", "<leader>hr", "require('spectre').open()", "Replace")
