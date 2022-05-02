-- =================
-- toggleterm.lua --- 浮窗终端
-- Author: MuCheng
-- =================
--
local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  vim.notify("Load toggleterm Failed")
  return
end

toggleterm.setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal"
    }
  }
}

local keys = require("utils.keys")
keys.mapKey("n", "<C-T>", "<CMD>exe v:count1 . 'ToggleTerm'<CR>")
keys.mapKey("i", "<C-T>", "<ESC><CMD>exe v:count1 . 'ToggleTerm'<CR>")

function _Set_terminal_keymaps()
  keys.mapBufKey(0, "t", "<ESC>", [[<C-\><C-n>]])
  -- keys.mapBufKey(0, "t", "jk", [[<C-\><C-n>]])
  keys.mapBufKey(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]])
  keys.mapBufKey(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]])
  keys.mapBufKey(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]])
  keys.mapBufKey(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]])
end

local api = require("utils.api")
api.autocmd(
  {"TermOpen"},
  {
    pattern = {"term://*"},
    command = "lua _Set_terminal_keymaps()"
  }
)

-- vim.cmd("autocmd TermOpen term://* lua _Set_terminal_keymaps()")

local wk = require("which-key")
wk.register(
  {
    o = {
      name = "+Term",
      f = {"<CMD>ToggleTerm direction=float<CR>", "Toggle In Float"},
      t = {"<CMD>ToggleTerm direction=tab<CR>", "Toggle In Tab"},
      h = {"<CMD>ToggleTerm direction=horizontal<CR>", "Toggle In horizontal"},
      v = {"<CMD>ToggleTerm direction=vertical<CR>", "Toggle In Vertical"},
      c = {
        name = "+Call",
        h = {"<CMD>lua _HTOP_TOGGLE()<CR>", "Htop"}
      }
    }
  },
  {prefix = "<leader>"}
)

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
function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local htop = Terminal:new({cmd = "htop", hidden = true})
function _HTOP_TOGGLE()
  htop:toggle()
end
