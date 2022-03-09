-- =================
-- comment-tree.lua --- 智能注释插件配置
-- Author: MuCheng
-- =================
--
local ok, comment = pcall(require, "Comment")
if not ok then
  print("require comment failed")
  return
end

comment.setup {
  ignore = function()
    if vim.bo.filetype == "lua" then
      return "^$"
    end
  end,
  -- pre_hook = function(ctx)
  --   if vim.bo.filetype == "raml" then
  --     return "/*%s*/"
  --   end
  -- end,
}

-- 自定义不同类型文件的注释方式, 应该放到不同的语言配置文件中,使用详情见下方链接
-- https://github.com/numToStr/Comment.nvim#%EF%B8%8F-filetypes--languages
--
-- local ft_ok, ft = pcall(require, "Comment.ft")
-- if not ok then
--   print("require comment ft failed")
--   return
-- end

-- ft.set("raml", "#%s")
