-- =================
-- git.lua --- git 插件配置
-- Author: MuCheng
-- =================
--
local keys = require("utils.keys")
local wk = require("which-key")

-- git-blame
-- 默认关闭 git blame
vim.g.gitblame_enabled = 0

wk.register({
  g = {
    name = "+Git",
    b = {
      name = "+Blame",
      t = {"<CMD>GitBlameToggle<CR>", "Toggle"},
      e = {"<CMD>GitBlameEnable<CR>", "Enable"},
      d = {"<CMD>GitBlameDisable<CR>", "Disable"},
      c = {"<CMD>GitBlameCopySHA<CR>", "Copy SHA"},
      u = {"<CMD>GitBlameOpenCommitURL<CR>", "Open URL"}
    },
  }
}, { prefix = "<leader>" })


-- gitsigns
local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  vim.notify("Load gitsigns Failed", "warn")
end

gitsigns.setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '!', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },

  on_attach = function(bufnr)

    keys.mapBufKey(bufnr, 'n', ']g', "&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    keys.mapBufKey(bufnr, 'n', '[g', "&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
    wk.register({
      ["]g"] = {"Next Git Hunk"},
      ["[g"] = {"Previous Git Hunk"},
    }, { buffer=bufnr })

    -- keys.mapBufKey(bufnr, 'n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>')
    -- keys.mapBufKey(bufnr, 'n', '<leader>gD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    wk.register({
      g = {
        a = {"<CMD>Gitsigns stage_hunk<CR>", "Add Hunk"},
        A = {"<CMD>Gitsigns stage_buffer<CR>", "Add Buffer"},
        r = {"<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk"},
        R = {"<CMD>Gitsigns reset_buffer<CR>", "Reset Buffer"},
        u = {"<CMD>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk"},

        p = {"<CMD>Gitsigns preview_hunk<CR>", "Preview Hunk"},
        s = {"<cmd>lua require'gitsigns'.blame_line{full=true}<CR>", "Show Full Blame Line"},

        t = {"<CMD>Gitsigns toggle_current_line_blame<CR>", "开关文件变动展示"},
        c = {"<CMD>>Gitsigns toggle_deleted<CR>", "开关删除部分展示"},
      },
    }, { prefix = "<leader>", buffer = bufnr})

    wk.register({
      g = {
        name = "+Git",
        a = {"<CMD>Gitsigns stage_hunk<CR>", "Add Hunk"},
        r = {"<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk"},
      }
    }, { mode = "v", prefix = "<leader>", buffer=bufnr })

    -- Text object
    keys.mapBufKey(bufnr, 'o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    keys.mapBufKey(bufnr, 'x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}



