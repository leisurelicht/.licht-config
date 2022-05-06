-- ==============
-- lspsaga.lua --- lsp 提示美化
-- Author: MuCheng
-- =================
--
local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
  vim.notify("Load lspsaga Failed", "warn")
  return
end

lspsaga.setup {
  error_sign = " ",
  warn_sign = " ",
  hint_sign = " ",
  infor_sign = " ",
  diagnostic_header_icon = " ",
  -- 正在写入的行提示
  code_action_icon = " ",
  finder_action_keys = {
    open = "i",
    vsplit = "s",
    split = "o",
    quit = "<Esc>",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>"
  },
  code_action_prompt = {
    -- 显示写入行提示
    -- 如果为 true ，则写代码时会在左侧行号栏中显示你所定义的图标
    enable = false,
    sign = true,
    sign_priority = 40,
    virtual_text = true
  },
  -- 快捷键配置
  code_action_keys = {
    quit = "<Esc>",
    exec = "<CR>"
  },
  rename_action_keys = {
    quit = "<Esc>",
    exec = "<CR>"
  }
}

vim.cmd(
  [[
augroup lspsaga_filetypes
  autocmd!
  autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
augroup END
]]
)
