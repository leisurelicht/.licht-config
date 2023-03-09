-- =================
-- init.lua -
-- Note: 自动命令配置
-- Author: MuCheng
-- =================
--
-- Check if we need to reload the file when it changed
api.autocmd(
  {"FocusGained", "TermClose", "TermLeave"},
  {
    group = api.augroup("checktime"),
    command = "checktime"
  }
)

-- Highlight on yank
api.autocmd(
  "TextYankPost",
  {
    group = api.augroup("highlight_yank"),
    callback = function()
      vim.highlight.on_yank()
    end
  }
)

-- close some filetypes with <q>
api.autocmd(
  "FileType",
  {
    group = api.augroup("close_with_q"),
    pattern = {
      "PlenaryTestPopup",
      "help",
      "lspinfo",
      "man",
      "notify",
      "qf",
      "query", -- :InspectTree
      "spectre_panel",
      "startuptime",
      "tsplayground"
    },
    callback = function(event)
      vim.bo[event.buf].buflisted = false
      vim.keymap.set("n", "q", "<cmd>close<cr>", {buffer = event.buf, silent = true})
    end
  }
)

-- wrap and check for spell in text filetypes
api.autocmd(
  "FileType",
  {
    group = api.augroup("wrap_spell"),
    pattern = {"gitcommit", "markdown"},
    callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.spell = true
    end
  }
)
