-- =================
-- sys.lua --- 系统函数
-- Author: MuCheng
-- =================
--
M = {}

local fn = vim.fn

function M.IsMacOS()
  return fn.has("mac")
end

function M.IsLinux()
  return fn.has("unix") and not fn.has("macunix") and not fn.has("win32unix")
end

function M.IsWindows()
  return fn.has("win16") or fn.has("win32") or fn.has("win64")
end

function M.IsGUI()
  return fn.has("gui_running")
end

return M
