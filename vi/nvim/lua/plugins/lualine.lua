-- =================
-- lualine.lua --- 状态栏配置
-- Author: MuCheng
-- =================
--
local ok, lualine = pcall(require, "lualine")
if not ok then
  print("require lualine failed")
  return
end

local function window_num()
  -- local num = vim.inspect([[%{tabpagewinnr(tabpagenr())}]])
  local num = [[%{winnr()}]]
  return num
end


lualine.setup {
  -- options = { fmt = string.lower },
  sections = {
    lualine_a = {
      window_num,
      {
        "mode",
        fmt = function(str) return str:sub(1,1) end,
      },
    },
  },
  inactive_sections = {
    lualine_a = {
      {
        window_num,
        color = { fg = 'white' },
      },
    },
  },
  extensions = { 
    "nvim-tree", 
    "symbols-outline",
    "fzf",
  }


}

dump({1,2,3})
