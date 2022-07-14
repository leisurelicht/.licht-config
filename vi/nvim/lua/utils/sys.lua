-- =================
-- sys.lua --- 系统函数
-- Author: MuCheng
-- =================
--
Sys = {}

local fn = vim.fn

function Sys.IsMacOS()
	return fn.has("mac")
end

function Sys.IsLinux()
	return fn.has("unix") and not fn.has("macunix") and not fn.has("win32unix")
end

function Sys.IsWindows()
	return fn.has("win16") or fn.has("win32") or fn.has("win64")
end

function Sys.IsGUI()
	return fn.has("gui_running")
end

return Sys
