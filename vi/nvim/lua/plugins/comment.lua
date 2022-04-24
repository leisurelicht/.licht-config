-- =================
-- comment-tree.lua --- 智能注释插件配置
-- Author: MuCheng
-- =================
--
local ok, comment = pcall(require, "Comment")
if not ok then
  vim.notify("Load comment Failed", "warn")
  return
end

comment.setup {
  ignore = function() if vim.bo.filetype == "lua" then return "^$" end end,

  pre_hook = function(ctx)
    local U = require 'Comment.utils'

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location =
          require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return
        require('ts_context_commentstring.internal').calculate_commentstring {
          key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
          location = location
        }
  end
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
