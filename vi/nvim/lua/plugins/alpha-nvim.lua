-- =================
-- alpha-nvim.lua --- 启动界面主题配置
-- Author: MuCheng
-- =================
--
local ok, alpha = pcall(require, "alpha")
if not ok then
  print("require alpha failed")
  return
end

alpha.setup(require'alpha.themes.dashboard'.config)
