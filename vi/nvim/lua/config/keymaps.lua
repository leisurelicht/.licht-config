-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>`", "<nop>")
map("n", "<leader>l", "<nop>")
map("n", "<leader>L", "<nop>")
map("n", "<leader><tab>l", "<nop>")
map("n", "<leader><tab>f", "<nop>")
map("n", "<leader><tab><tab>", "<nop>")
map("n", "<leader><tab>]", "<nop>")
map("n", "<leader><tab>d", "<nop>")
map("n", "<leader><tab>[", "<nop>")

-- lazy
map("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- LazyVim Changelog
map("n", "<leader>pc", Util.changelog, { desc = "LazyVim Changelog" })

-- tabs
map("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader>ta", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader>te", "<cmd>tab sb<cr>", { desc = "Copy current tab" })
map("n", "[t", "<cmd>tabp<cr>", { desc = "Previous tab" })
map("n", "]t", "<cmd>tabn<cr>", { desc = "Next tab" })
map("n", "<leader>tP", "<cmd>-tabmove<cr>", { desc = "Move forward" })
map("n", "<leader>tN", "<cmd>+tabmove<cr>", { desc = "Move backward" })

-- tab页快速切换
map("n", "<leader>t1", "1gt", { desc = "Tab 1" })
map("n", "<leader>t2", "2gt", { desc = "Tab 2" })
map("n", "<leader>t3", "3gt", { desc = "Tab 3" })
map("n", "<leader>t4", "4gt", { desc = "Tab 4" })
map("n", "<leader>t5", "5gt", { desc = "Tab 5" })
map("n", "<leader>t6", "6gt", { desc = "Tab 6" })
map("n", "<leader>t7", "7gt", { desc = "Tab 7" })
map("n", "<leader>t8", "8gt", { desc = "Tab 8" })

-- window
map("n", "<leader>wh", "<cmd>vertical leftabove sbuffer<cr>", { desc = "Left" })
map("n", "<leader>wl", "<cmd>vertical rightbelow sbuffer<cr>", { desc = "Right" })
map("n", "<leader>wk", "<cmd>horizontal aboveleft sbuffer<cr>", { desc = "Above" })
map("n", "<leader>wj", "<cmd>horizontal belowright sbuffer<cr>", { desc = "Below" })
map("n", "<leader>wy", "<cmd>vertical topleft sbuffer<cr>", { desc = "Far left" })
map("n", "<leader>wo", "<cmd>vertical botright sbuffer<cr>", { desc = "Far right" })
map("n", "<leader>wi", "<cmd>horizontal topleft sbuffer<cr>", { desc = "Top" })
map("n", "<leader>wu", "<cmd>horizontal botright sbuffer<cr>", { desc = "Bottom" })
map("n", "<leader>wd", "<C-w>c", { desc = "Close current window" }) -- 关闭当前分屏
map("n", "<leader>wc", "<C-w>o", { desc = "Close other window" }) -- 关闭其他分屏
