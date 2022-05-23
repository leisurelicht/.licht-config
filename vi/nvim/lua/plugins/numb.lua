-- =================
-- numb.lua --- number 增强
-- Author: MuCheng
-- =================
--
local ok, numb = pcall(require, "numb")
if not ok then
    vim.notify("Load numb Failed", "warn")
    return
end

numb.setup()
