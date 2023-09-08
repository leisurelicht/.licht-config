-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")
local map = require("utils.map")

map.del("n", "<leader>`")

-- Lazy
map.del("n", "<leader>l")
map.del("n", "<leader>L")
map.set("n", "<leader>pl", "<cmd>Lazy<cr>", "Lazy") -- lazy
map.set("n", "<leader>pc", Util.changelog, "LazyVim Changelog") -- LazyVim Changelog

-- Tabs
map.del("n", "<leader><tab>l")
map.del("n", "<leader><tab>f")
map.del("n", "<leader><tab><tab>")
map.del("n", "<leader><tab>]")
map.del("n", "<leader><tab>d")
map.del("n", "<leader><tab>[")
map.set("n", "<leader>tl", "<cmd>tablast<cr>", "Last Tab")
map.set("n", "<leader>tf", "<cmd>tabfirst<cr>", "First Tab")
map.set("n", "<leader>ta", "<cmd>tabnew<cr>", "New Tab")
map.set("n", "<leader>tn", "<cmd>tabnext<cr>", "Next Tab")
map.set("n", "<leader>td", "<cmd>tabclose<cr>", "Close Tab")
map.set("n", "<leader>tp", "<cmd>tabprevious<cr>", "Previous Tab")
map.set("n", "<leader>te", "<cmd>tab sb<cr>", "Copy current tab")
map.set("n", "[t", "<cmd>tabp<cr>", "Previous tab")
map.set("n", "]t", "<cmd>tabn<cr>", "Next tab")
map.set("n", "<leader>tP", "<cmd>-tabmove<cr>", "Move forward")
map.set("n", "<leader>tN", "<cmd>+tabmove<cr>", "Move backward")
-- tab页快速切换
map.set("n", "<leader>t1", "1gt", "Tab 1")
map.set("n", "<leader>t2", "2gt", "Tab 2")
map.set("n", "<leader>t3", "3gt", "Tab 3")
map.set("n", "<leader>t4", "4gt", "Tab 4")
map.set("n", "<leader>t5", "5gt", "Tab 5")
map.set("n", "<leader>t6", "6gt", "Tab 6")
map.set("n", "<leader>t7", "7gt", "Tab 7")
map.set("n", "<leader>t8", "8gt", "Tab 8")

-- window
map.del("n", "<leader>w|")
map.del("n", "<leader>w-")
map.del("n", "<leader>wd")
map.del("n", "<leader>ww")
map.lazy("n", "<leader>wh", "<cmd>vertical leftabove sbuffer<cr>", "Split to left")
map.lazy("n", "<leader>wl", "<cmd>vertical rightbelow sbuffer<cr>", "Split to right")
map.lazy("n", "<leader>wk", "<cmd>horizontal aboveleft sbuffer<cr>", "Split to above")
map.lazy("n", "<leader>wj", "<cmd>horizontal belowright sbuffer<cr>", "Split to below")
map.lazy("n", "<leader>wy", "<cmd>vertical topleft sbuffer<cr>", "Split to far left")
map.lazy("n", "<leader>wo", "<cmd>vertical botright sbuffer<cr>", "Split to far right")
map.lazy("n", "<leader>wi", "<cmd>horizontal topleft sbuffer<cr>", "Split to top")
map.lazy("n", "<leader>wu", "<cmd>horizontal botright sbuffer<cr>", "Split to bottom")
map.lazy("n", "<leader>wd", "<C-w>c", "Close current window") -- 关闭当前分屏
map.lazy("n", "<leader>wc", "<C-w>o", "Close other window") -- 关闭其他分屏

map.del("n", "<leader>bb")
map.lazy("n", "<leader>bb", "<cmd>e #<cr>", "Switch to Other Buffer")
