-- =================
-- theme.lua --- theme config file
-- Author: MuCheng
-- =================
--
local onedark_ok, onedark = pcall(require, "onedark")
if onedark_ok then onedark.setup {style = 'dark', ending_tildes = true} end

