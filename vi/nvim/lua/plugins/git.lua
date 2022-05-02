-- =================
-- git.lua --- git 插件配置
-- Author: MuCheng
-- =================
--
local keys = require("utils.keys")
local wk = require("which-key")

local git_key_name = "+Git"

local Terminal = require("toggleterm.terminal").Terminal
local lazygit =
  Terminal:new(
  {
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "curved" -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      keys.mapBufKey(term.bufnr, "n", "q", "<CMD>close<CR>", {noremap = true, silent = true})
    end
    -- function to run on closing the terminal
    -- on_close = function(term)
    --   vim.cmd("Closing terminal")
    -- end
  }
)

function _Lazygit_toggle()
  lazygit:toggle()
end

wk.register(
  {
    g = {
      name = git_key_name,
      l = {"<CMD>lua _Lazygit_toggle()<CR>", "Lazygit"}
    }
  },
  {prefix = "<leader>"}
)

-- git-blame
-- 默认关闭 git blame
vim.g.gitblame_enabled = 0

wk.register(
  {
    g = {
      name = git_key_name,
      b = {
        name = "+Blame",
        t = {"<CMD>GitBlameToggle<CR>", "Toggle"},
        e = {"<CMD>GitBlameEnable<CR>", "Enable"},
        d = {"<CMD>GitBlameDisable<CR>", "Disable"},
        c = {"<CMD>GitBlameCopySHA<CR>", "Copy SHA"},
        u = {"<CMD>GitBlameOpenCommitURL<CR>", "Open URL"}
      }
    }
  },
  {prefix = "<leader>"}
)

-- gitsigns
local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  vim.notify("Load gitsigns Failed", "warn")
else
  gitsigns.setup {
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = "+",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn"
      },
      change = {
        hl = "GitSignsChange",
        text = "!",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn"
      },
      delete = {
        hl = "GitSignsDelete",
        text = "-",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn"
      },
      changedelete = {
        hl = "GitSignsChange",
        text = "~",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn"
      }
    },
    on_attach = function(bufnr)
      keys.mapBufKey(bufnr, "n", "]g", "&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>'", {expr = true})
      keys.mapBufKey(bufnr, "n", "[g", "&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>'", {expr = true})
      wk.register({["]g"] = {"Next Git Hunk"}, ["[g"] = {"Previous Git Hunk"}}, {buffer = bufnr})

      -- keys.mapBufKey(bufnr, 'n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>')
      -- keys.mapBufKey(bufnr, 'n', '<leader>gD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
      wk.register(
        {
          g = {
            name = git_key_name,
            a = {"<CMD>Gitsigns stage_hunk<CR>", "Add Hunk"},
            A = {"<CMD>Gitsigns stage_buffer<CR>", "Add Buffer"},
            r = {"<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk"},
            R = {"<CMD>Gitsigns reset_buffer<CR>", "Reset Buffer"},
            u = {"<CMD>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk"},
            p = {"<CMD>Gitsigns preview_hunk<CR>", "Preview Hunk"},
            s = {
              "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>",
              "Show Blame Line"
            },
            t = {"<CMD>Gitsigns toggle_current_line_blame<CR>", "Toggle Gitsigns"},
            c = {"<CMD>>Gitsigns toggle_deleted<CR>", "Toggle Deleted"}
          }
        },
        {prefix = "<leader>", buffer = bufnr}
      )

      wk.register(
        {
          g = {
            name = git_key_name,
            a = {"<CMD>Gitsigns stage_hunk<CR>", "Add Hunk"},
            r = {"<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk"}
          }
        },
        {mode = "v", prefix = "<leader>", buffer = bufnr}
      )

      -- Text object
      keys.mapBufKey(bufnr, "o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
      keys.mapBufKey(bufnr, "x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end
  }
end
